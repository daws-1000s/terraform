resource "aws_instance" "expense" {
    for_each = var.instances
    ami = "ami-0733cbac1dcca0be4"
    instance_type = each.value

    vpc_security_group_ids = [ aws_security_group.allow_ssh.id ]

    tags = {
      Name = each.key
    }

}

resource "aws_security_group" "allow_ssh" {
    name = "allow-ssh"
    description = "Allow port number 22"

    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
        ipv6_cidr_blocks = ["::/0"]
    }

    egress {
        from_port = 0
        to_port = 0
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
        ipv6_cidr_blocks = ["::/0"]
    }

    tags = {
      Name = "For-each-ssh"
    }
  
}