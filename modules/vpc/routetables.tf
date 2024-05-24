# route table
resource "aws_route_table" "public_rtb" {
    vpc_id = aws_vpc.vpc.id
    tags = merge(
        tomap({
            Name = "${var.common_tags["Project"]}-${var.common_tags["Environment"]}-public-rtb"
        }),
        var.common_tags
    )
}

resource "aws_route_table" "private_rtb" {
    vpc_id = aws_vpc.vpc.id
    tags = merge(
        tomap({
            Name = "${var.common_tags["Project"]}-${var.common_tags["Environment"]}-private-rtb"
        }),
        var.common_tags
    )
}

resource "aws_route_table_association" "public_rtb_association" {
    count = length(aws_subnet.public_subnets)
    route_table_id = aws_route_table.public_rtb.id
    subnet_id = aws_subnet.public_subnets[count.index].id
}

resource "aws_route_table_association" "private_rtb_association" {
    count = length(aws_subnet.private_subnets)
    route_table_id = aws_route_table.private_rtb.id
    subnet_id = aws_subnet.private_subnets[count.index].id
}

resource "aws_route" "public_rtb_rt_0" {
  route_table_id = aws_route_table.public_rtb.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id = aws_internet_gateway.igw.id
}