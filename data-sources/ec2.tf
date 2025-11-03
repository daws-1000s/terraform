resource "aws_instance" "expense" {
    count = length(var.instance_names)
    ami = data.aws_ami.joindevops.id
    vpc_security_group_ids = [aws_security_group.allow_ssh.id]
    instance_type = "t2.micro"

    tags = merge(
        var.common_tags,
        {
            Name = var.instance_names[count.index]
        }
    )
  
}

resource "aws_security_group" "allow_ssh" {
    name = var.sg_name
    description = "allow ssh port 22"

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