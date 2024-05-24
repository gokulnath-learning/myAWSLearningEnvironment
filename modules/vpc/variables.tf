variable "vpc_cidr" {
    description = "CIDR for the VPC"
}

variable "common_tags" {
    description = "Common tags which will be added to all the resources created"
}

variable "used_azs" {
    default = ["ap-south-1a", "ap-south-1b"]
}