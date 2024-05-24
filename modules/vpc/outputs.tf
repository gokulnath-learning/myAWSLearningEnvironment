#outputs
output "vpc_id" {
  value = aws_vpc.vpc.id
}

output "public_subnet_ids" {
  value = aws_subnet.public_subnets[*].id
}

output "private_subnet_ids" {
  value = aws_route_table.private_rtb[*].id
}

output "igw" {
  value = aws_internet_gateway.igw.id
}