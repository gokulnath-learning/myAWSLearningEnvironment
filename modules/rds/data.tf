data "aws_vpc" "private_vpc" {
  tags = {
    is_public = "false"
  }
}

data "aws_subnets" "private_subnets" {
  tags = {
    is_public = "false"
  }
}

data "aws_ssm_parameter" "db_password" {
  name = var.db_parameters.db_password_ssm_parameter
  with_decryption = true
}