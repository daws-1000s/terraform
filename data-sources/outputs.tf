output "ami_id" {
    value = data.aws_ami.joindevops.id  
}

# output "instance_info" {
#     value = aws_instance.expense
# }