resource "aws_route53_record" "expense" {
    count = length(var.instance_names)
    ttl = 1
    type = "A"
    zone_id = var.zone_id
    name = var.instance_names[count.index] == "frontend" ? var.domain_name : "${var.instance_names[count.index]}.${var.domain_name}"

    records = var.instance_names[count.index] == "frontend" ? [aws_instance.terraform[count.index].public_ip] : [aws_instance.terraform[count.index].private_ip]
  
}