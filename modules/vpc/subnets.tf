#subnets
resource "aws_subnet" "private_subnets" {
    count = length(var.used_azs)
    vpc_id = aws_vpc.vpc.id
    availability_zone = var.used_azs[count.index]
    cidr_block = cidrsubnet(aws_vpc.vpc.cidr_block, 2, count.index)

    tags = merge(
        tomap({ Name = "${var.common_tags["Project"]}-${var.common_tags["Environment"]}-subnet-private-${count.index}" }),
        tomap({ Description = "Private Subnet - ${var.used_azs[count.index]}" }),
        var.common_tags
    )
}

resource "aws_subnet" "public_subnets" {
    count = length(var.used_azs)
    vpc_id = aws_vpc.vpc.id
    availability_zone = var.used_azs[count.index]
    cidr_block = cidrsubnet(aws_vpc.vpc.cidr_block, 2, count.index + 2)
    map_public_ip_on_launch = true

    tags = merge(
        tomap({ Name = "${var.common_tags["Project"]}-${var.common_tags["Environment"]}-subnet-public-${count.index}" }),
        tomap({ Description = "Public Subnet - ${var.used_azs[count.index]}" }),
        var.common_tags
    )
}