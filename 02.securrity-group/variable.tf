variable "project_name" {
    default = "expense"
}

variable "environment" {
    default = "dev"
}

variable "common_tags" {
    type = map 
    default = {
        project = "expense"
        environment = "dev"
        Terraform = "true"
    }
}

variable "sg_description" {
    type = string 
    default = "SG for DB MySQL Instances"
}

