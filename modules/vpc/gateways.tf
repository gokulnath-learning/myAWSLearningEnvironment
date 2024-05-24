# internet gateway
resource "aws_internet_gateway" "igw" {
    vpc_id = aws_vpc.vpc.id
    tags = merge(
        tomap({
            Name = "${var.common_tags["Project"]}-${var.common_tags["Environment"]}-igw"
        }),
        var.common_tags
    )
}