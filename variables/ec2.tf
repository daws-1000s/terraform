# 1. command line
# 2. terraform.tfvars
# 3. environment variables, TF_VAR_your_variable_name
# 4. default
# 5. prompt

resource "aws_security_group" "allow_ssh_terraform" {
    name = var.sg_name
    description = var.sg_description

    egress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
        ipv6_cidr_blocks = ["::/0"]
    }

    ingress {
        from_port = var.from_port
        to_port = var.to_port
        protocol = var.protocol
        cidr_blocks = var.ingress_cidr
        ipv6_cidr_blocks = ["::/0"]
    }
  
}


resource "aws_instance" "terraform" {

    ami = var.ami_id
    instance_type = var.instance_type

    vpc_security_group_ids = [aws_security_group.allow_ssh_terraform.id]

    tags = var.tags  
}