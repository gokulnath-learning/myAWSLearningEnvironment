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
}