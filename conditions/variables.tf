variable "environment" {
    default = "prod"
  
}

variable "tags" {
    default = {
        Name = "conditions"
        Environment= "dev"
        Project = "expense"
    }
  
}