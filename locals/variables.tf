variable "common_tags" {
    default = {
        Project = "expense"
        Terraform = "true"
        Environment = "dev"
    }
}

variable "instance_names" {
    type = list(string)
    default = [ "mysql", "backend", "frontend" ]
}

# variable "zone_id" {
#     default = "Z0951733247NJS9XF1LII"  
# }

# variable "domain_name" {
#     default = "daws81s.online"
# }

variable "environment" {
    default = "prod"
}