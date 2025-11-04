resource "aws_instance" "terraform" {
    count = length(var.instance_names)
    ami = "ami-0733cbac1dcca0be4"
    instance_type = "t2.micro"
    vpc_security_group_ids = [aws_security_group.allow_ssh.id]

    tags = merge(
        var.common_tags,
        {
            Name = var.instance_names[count.index]
        }
    )
}

resource "aws_security_group" "allow_ssh" {
    name = "allow-ssh"
    description = "allow ssh port number 22"

    egress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
}