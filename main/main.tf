module "vpc" {
    source = "../modules/vpc"
    common_tags = var.common_tags
    vpc_cidr = var.vpc_cidr
}

module "ec2" {
    source = "../modules/ec2"
    for_each = var.ec2_parameters
    ec2_parameters = each.value
    common_tags = var.common_tags
    subnets = module.vpc.public_subnets
    key_name = aws_key_pair.keypair.key_name
}