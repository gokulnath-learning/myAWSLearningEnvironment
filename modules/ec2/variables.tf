variable "ec2_parameters" {
}

variable "subnets" {
    description = "subnet for the ec2 to be launched"
}

variable "key_name" {
    description = "Ket pair for the ec2 instance for login"
}

/*

variable "server_name" {
    description = "Name of the server"
}*/

variable "common_tags" {
    description = "Common tags which will be added to all the resources created"
}

