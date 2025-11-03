resource "aws_route53_record" "expense" {
    count = length(var.instance_names)
    type = "A"
    ttl = 1
    name = "${var.instance_names[count.index]}.${var.domain_name}"
    zone_id = var.zone_id
    records = [aws_instance.expense[count.index].private_ip]
  
}