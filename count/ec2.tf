resource "aws_instance" "backend" {
    count = length(var.instance_names)
    ami = "ami-0733cbac1dcca0be4"
    instance_type = "t2.micro"
    vpc_security_group_ids = [aws_security_group.allow_ssh.id]

    # tags = {
    #     Name = var.instance_name[count.index]
    # }

    tags = merge(
        var.common_tags,
        {
            Name = var.instance_names[count.index]
        }
    )
  
}

resource "aws_security_group" "allow_ssh" {
    name = "allow_ssh"
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

    tags = merge(
        var.common_tags,
        {
            Name = "allow-ssh"
        }
    )
  
}