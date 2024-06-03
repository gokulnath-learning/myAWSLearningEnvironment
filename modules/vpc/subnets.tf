#subnets
resource "aws_subnet" "subnets" {
  count                   = length(var.used_azs)
  vpc_id                  = aws_vpc.vpc.id
  availability_zone       = var.used_azs[count.index]
  cidr_block              = cidrsubnet(aws_vpc.vpc.cidr_block, 1, count.index)
  map_public_ip_on_launch = var.vpc_parameters.is_public ? true : false

  tags = merge(
    tomap({ Name = "${var.common_tags["Project"]}-${var.common_tags["Environment"]}-subnet-${var.vpc_parameters.vpc_name}-${count.index}" }),
    tomap({ Description = "${var.vpc_parameters.vpc_name} Subnet - ${var.used_azs[count.index]}" }),
    tomap({is_public = "${var.vpc_parameters.is_public}" }),
    var.common_tags
  )
}