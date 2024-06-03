# route table
resource "aws_route_table" "rtb" {
  vpc_id = aws_vpc.vpc.id
  tags = merge(
    tomap({
      Name = "${var.common_tags["Project"]}-${var.common_tags["Environment"]}-${var.vpc_parameters.vpc_name}-rtb"
    }),
    var.common_tags
  )
}

resource "aws_route_table_association" "rtb_association" {
  count          = length(aws_subnet.subnets)
  route_table_id = aws_route_table.rtb.id
  subnet_id      = aws_subnet.subnets[count.index].id
}


resource "aws_route" "rtb_rt_0" {
  count                  = var.vpc_parameters.is_public ? 1 : 0
  route_table_id         = aws_route_table.rtb.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.igw[count.index].id
}

resource "aws_route" "rtb_rt_1" {
    vpc_peering_connection_id = "pcx-0f9ffcdbb1b1eefc4"
    route_table_id = aws_route_table.rtb.id
    destination_cidr_block = "10.0.0.0/8"
}