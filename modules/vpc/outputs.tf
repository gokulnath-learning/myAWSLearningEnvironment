output "vpc" {
  value = aws_vpc.vpc
}

output "subnets" {
  value = aws_subnet.subnets
}

output "sg" {
  value = aws_security_group.sg
}