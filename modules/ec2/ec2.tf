resource "aws_instance" "ec2" {
    count = var.ec2_parameters.instance_count
    ami = var.ec2_parameters.ami_id
    instance_type = var.ec2_parameters.instance_type
    availability_zone = var.subnets[count.index].availability_zone
    subnet_id = var.subnets[count.index].id
    key_name = var.key_name

    volume_tags = merge(
        var.common_tags,
        tomap({Name = "${var.common_tags["Project"]}-${var.common_tags["Environment"]}-${var.ec2_parameters.server_name}"})
    )

    tags = merge(
        var.common_tags,
        tomap({Name = "${var.common_tags["Project"]}-${var.common_tags["Environment"]}-${var.ec2_parameters.server_name}"})
    )
}