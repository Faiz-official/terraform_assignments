resource "aws_db_subnet_group" "rds_subnet" {
  name       = "rds-subnet-group"
  subnet_ids = [var.r_private_subnet_id_1, var.r_private_subnet_id_2]
}

resource "aws_db_instance" "rds_instance" {
  identifier          = "web-rds"
  allocated_storage   = 20
  engine              = "postgres"
  instance_class      = var.r_db_instance_class
  username            = var.r_db_username
  password            = var.r_db_password
  db_subnet_group_name = aws_db_subnet_group.rds_subnet.name
  skip_final_snapshot = true
}
