# -----------------------------
# SECURITY GROUP
# -----------------------------
resource "aws_security_group" "allow_ssh" {
  name        = "allow-ssh-provisioners"
  description = "Allow SSH (22) and HTTP (80) access"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"   # allow all outbound protocols
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow-ssh-provisioners"
  }
}

# -----------------------------
# EC2 INSTANCE
# -----------------------------
resource "aws_instance" "expense" {
  ami                         = "ami-0733cbac1dcca0be4"  # Amazon Linux 2023 AMI (verify region)
  instance_type               = "t2.micro"
  associate_public_ip_address  = true   # ✅ ensures internet access
  vpc_security_group_ids       = [aws_security_group.allow_ssh.id]
  key_name                     = "usnorthvirginia"  # your existing key pair name

  tags = {
    Name = "provisioners"
  }

  # Save private IP locally
  provisioner "local-exec" {
    command = "echo ${self.private_ip} > private_ip.txt"
  }

  # SSH connection for remote-exec
  connection {
    type        = "ssh"
    user        = "ec2-user"
    host        = self.public_ip
    private_key = file("C:/Users/PC/Downloads/usnorthvirginia.pem")
  }

# provisioners will execute while creation of instance
  # Remote commands to install & start Nginx
  provisioner "remote-exec" {
    inline = [
      "sleep 30",
      "sudo yum -y update",
      "sudo yum install nginx -y",
      "sudo systemctl enable nginx",
      "sudo systemctl start nginx"
    ]
  }
}

# -----------------------------
# OUTPUTS
# -----------------------------
output "public_ip" {
  description = "Public IP of the EC2 instance"
  value       = aws_instance.expense.public_ip
}

output "private_ip" {
  description = "Private IP of the EC2 instance"
  value       = aws_instance.expense.private_ip
}