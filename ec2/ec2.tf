resource "aws_security_group" "allow_ssh_terraform" {
    name = "allow_ssh_prac"
    description = "Allow port number 22 for ssh"

    egress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
        ipv6_cidr_blocks = ["::/0"]
    }

    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
        ipv6_cidr_blocks = ["::/0"]
    }

    tags = {
      Name = "allow_ssh_prac"
    }
  
}


resource "aws_instance" "terraform" {
    ami = "ami-0733cbac1dcca0be4"
    instance_type = "t2.micro"
    vpc_security_group_ids = [aws_security_group.allow_ssh_terraform.id]

    tags = {
      Name = "ec2-tf"
    }
  
}