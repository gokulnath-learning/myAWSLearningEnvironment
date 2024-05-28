# key pair
resource "aws_key_pair" "keypair" {
    public_key = var.public_key
    key_name = var.key_name
    tags = merge(
        var.common_tags,
        tomap({Name = "${var.common_tags["Project"]}-${var.common_tags["Environment"]}-key"})
    )
}