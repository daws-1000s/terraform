variable "instance_names" {
    type = list(string)
    default = [ "mysql", "backend", "frontend" ]  
}

variable "sg_name" {
    type = string
    default = "allow-ssh-03"
}

variable "common_tags" {
    default = {
        Project = "expense"
        Environment= "dev"
        Terraform = "true"
    }
  
}

variable "domain_name" {
    default = "daws81s.online"
}

variable "zone_id" {
    default = "Z0951733247NJS9XF1LII"
  
}