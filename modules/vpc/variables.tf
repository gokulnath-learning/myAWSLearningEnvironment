variable "vpc_parameters" {
}

variable "common_tags" {
  description = "Common tags which will be added to all the resources created"
}

variable "used_azs" {
  default = ["ap-south-1a", "ap-south-1b"]
}

variable "default_ingress_ports" {
    default = [3389, 22, 80, 443, 8080]
}