# output "instance_info" {
#     value = aws_instance.terraform
# }

output "aws_ami" {
    value = data.aws_ami.ami_info.id  
}