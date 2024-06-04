# ec2
resource "aws_instance" "ec2_instance" {
    count = var.ec2_parameters.instance_count
    ami = var.ec2_parameters.ami_id
    instance_type = var.ec2_parameters.instance_type
    subnet_id = var.ec2_parameters.is_public ? data.aws_subnets.public_subnets.ids[count.index] : data.aws_subnets.private_subnets.ids[count.index]
    security_groups = var.ec2_parameters.is_public ? data.aws_security_groups.public_sgs.ids : data.aws_security_groups.private_sgs.ids
    key_name = var.key_name
    iam_instance_profile = "ec2-role"

    lifecycle {
      ignore_changes = [ security_groups ]
    }

    tags = merge(
        var.common_tags,
        tomap({ Name = "${var.common_tags["Project"]}-${var.common_tags["Environment"]}-${var.ec2_parameters.server_name}" }),
        tomap({is_public = "${var.ec2_parameters.is_public}" })
    )
}