module "vpc" {
    source = "../modules/vpc"
    common_tags = var.common_tags
    vpc_cidr = var.vpc_cidr
}

