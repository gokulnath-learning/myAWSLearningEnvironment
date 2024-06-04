module "vpc" {
  for_each       = var.vpc_parameters
  source         = "../modules/vpc"
  common_tags    = var.common_tags
  vpc_parameters = each.value
}

module "ec2" {
    for_each = var.ec2_parameters
    source = "../modules/ec2"
    ec2_parameters = each.value
    key_name = aws_key_pair.keypair.key_name
    common_tags = var.common_tags
}

module "db" {
    for_each = var.db_parameters
    source = "../modules/rds"
    db_parameters = each.value
    common_tags = var.common_tags
}