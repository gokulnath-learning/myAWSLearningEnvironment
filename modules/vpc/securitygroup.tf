resource "aws_security_group" "sg" {
    vpc_id = aws_vpc.vpc.id
    name = "${var.common_tags["Project"]}-${var.common_tags["Environment"]}-vpc-${var.vpc_parameters.vpc_name}-sg"
    
    tags = merge(
        var.common_tags,
        tomap({ Name = "${var.common_tags["Project"]}-${var.common_tags["Environment"]}-vpc-${var.vpc_parameters.vpc_name}-sg" }),
        tomap({is_public = "${var.vpc_parameters.is_public}" })
    )
}

resource "aws_security_group_rule" "sg_rule_egress" {
    security_group_id = aws_security_group.sg.id
    protocol = "-1"
    from_port = 0
    to_port = 0
    type = "egress"
    cidr_blocks = [ "0.0.0.0/0" ]
}

resource "aws_security_group_rule" "sg_rule_ingress" {
    count = length(var.default_ingress_ports)
    security_group_id = aws_security_group.sg.id
    protocol = "tcp"
    from_port = var.default_ingress_ports[count.index]
    to_port = var.default_ingress_ports[count.index]
    type = "ingress"
    cidr_blocks = var.vpc_parameters.is_public ? ["${data.external.myipaddr.result.ip}/32"] : ["10.0.0.0/8"]
}

data "external" "myipaddr" {
    program = ["bash", "-c", "curl -s 'https://api.ipify.org?format=json'"]
}