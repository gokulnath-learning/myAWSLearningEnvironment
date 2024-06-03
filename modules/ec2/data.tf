data "aws_subnets" "public_subnets" {
  tags = {
    is_public = "true"
  }
}

data "aws_subnets" "private_subnets" {
  tags = {
    is_public = "false"
  }
}

data "aws_security_groups" "public_sgs" {
    tags = {
        is_public = "true"
  }
}

data "aws_security_groups" "private_sgs" {
    tags = {
        is_public = "false"
  }
}