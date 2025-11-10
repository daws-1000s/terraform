# output "expense_instances" {
#     value = aws_instance.expense
# }

# output "instance_ids" {
#     value = aws_instance.expense.id[each.key]
  
# }

output "vpc_id" {
  value = aws_security_group.allow_ssh.id
}