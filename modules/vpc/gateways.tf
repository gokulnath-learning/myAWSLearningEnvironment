# internet gateway
resource "aws_internet_gateway" "igw" {
  count  = var.vpc_parameters.is_public ? 1 : 0
  vpc_id = aws_vpc.vpc.id
  tags = merge(
    tomap({
      Name = "${var.common_tags["Project"]}-${var.common_tags["Environment"]}-igw"
    }),
    tomap({
      VPC = aws_vpc.vpc.id
    }),
    var.common_tags
  )
}