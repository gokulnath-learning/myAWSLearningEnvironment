resource "aws_security_group" "db_sg" {
    vpc_id = data.aws_vpc.private_vpc.id
    name = "${var.common_tags["Project"]}-${var.common_tags["Environment"]}-db-sg"
    
    tags = merge(
        var.common_tags,
        tomap({ Name = "${var.common_tags["Project"]}-${var.common_tags["Environment"]}-db-sg" }),
    )
}

resource "aws_security_group_rule" "db_sg_rule_egress" {
    security_group_id = aws_security_group.db_sg.id
    protocol = "-1"
    from_port = 0
    to_port = 0
    type = "egress"
    cidr_blocks = [ "0.0.0.0/0" ]
}

resource "aws_security_group_rule" "db_sg_rule_ingress" {
    security_group_id = aws_security_group.db_sg.id
    protocol = "tcp"
    from_port = 3306
    to_port = 3306
    type = "ingress"
    cidr_blocks = [ "10.0.0.0/8" ]
}