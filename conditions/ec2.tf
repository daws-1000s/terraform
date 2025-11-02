resource "aws_instance" "terraform" {

    ami = "ami-0733cbac1dcca0be4"
    instance_type = var.environment == "prod" ? "t2.micro" :"t2.small"
    vpc_security_group_ids = [aws_security_group.allow_ssh.id]
    tags = var.tags
  
}

resource "aws_security_group" "allow_ssh" {
    name = "allow-ssh"
    description = "allow port number 22"

    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
  
}