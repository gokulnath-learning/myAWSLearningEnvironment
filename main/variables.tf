variable "vpc_parameters" {
  description = "CIDR for the VPC"
}

variable "common_tags" {
  description = "Common tags which will be added to all the resources created"
}

# key pair variables
variable "public_key" {
  description = "Public key of the locally created keypair"
}

variable "key_name" {
  description = "Key Name for the AWS resource"
}

# ec2
variable "ec2_parameters" {
}