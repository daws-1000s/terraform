variable "sg_name" {
    type = string
    default = "allow_sshh"
}

variable "sg_description" {
    type = string
    default = "allow port number 22"
}

variable "from_port" {
    type = number
    default = 22
}

variable "to_port" {
    type = number
    default = 22
}

variable "protocol" {
    type = string
    default = "tcp"
}

variable "ingress_cidr" {
    type = list(string)
    default = [ "0.0.0.0/0" ]
}

variable "ami_id" {
    type = string
    default = "ami-0733cbac1dcca0be4"
}

variable "instance_type" {
    type = string
    default = "t2.micro"
}

variable "tags" {
    type = map 
    default = {
        Name = "backend"
        Project = "expense"
        Component= "backend"
        Environment = "Dev"
        Terraform = "true"
    }
  
}