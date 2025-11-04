locals {
    domain_name = "daws81s.online"
    zone_id = "Z0951733247NJS9XF1LII"
    instance_type = var.environment == "prod" ? "t2.small" : "t2.micro"
}