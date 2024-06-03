# ec2
resource "aws_instance" "ec2_instance" {
    count = var.ec2_parameters.instance_count
    ami = var.ec2_parameters.ami_id
    instance_type = var.ec2_parameters.instance_type
    security_groups = []
    iam_instance_profile = "arn:aws:iam::654654413093:instance-profile/ec2-role"
}