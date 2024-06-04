resource "aws_db_instance" "mysql_db" {
    identifier = var.db_parameters.db_identifier
    db_subnet_group_name = aws_db_subnet_group.db_subnet_group.name
    instance_class = var.db_parameters.db_instance_class
    engine = var.db_parameters.db_engine
    engine_version = var.db_parameters.db_engine_version
    db_name = var.db_parameters.db_name
    username = var.db_parameters.db_username
    password = data.aws_ssm_parameter.db_password.value
    storage_type = var.db_parameters.db_storage_type
    allocated_storage = var.db_parameters.db_storage_size
    vpc_security_group_ids = [aws_security_group.db_sg.id]
    publicly_accessible = false
    skip_final_snapshot = true
}

resource "aws_db_subnet_group" "db_subnet_group" {
    name = var.db_parameters.db_subnet_group_name
    subnet_ids = data.aws_subnets.private_subnets.ids
    tags = merge(
        var.common_tags,
        tomap({ Name = "${var.common_tags["Project"]}-${var.common_tags["Environment"]}-mysql-subnet-group" }),
    )
}