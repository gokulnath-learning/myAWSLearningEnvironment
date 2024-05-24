# vpc block
# modify them accordingly based on the requiremnet
resource "aws_vpc" "vpc" {
    cidr_block = var.vpc_cidr
    enable_dns_hostnames = true
    enable_dns_support = true
    tags = merge(
        var.common_tags,
        tomap({Name = "${var.common_tags["Project"]}-${var.common_tags["Environment"]}-vpc"})
    )
}