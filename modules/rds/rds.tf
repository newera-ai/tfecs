# RDS creation
resource "aws_db_instance" "wp-rds" {
  identifier             = "wp-rds"
  engine                 = "mysql"
  engine_version         = "5.7"
  name                   = "wp"
  username               = "tfdemo_user"
  password               = "hcxFS5o23DF48fJDW"
  instance_class         = "db.t2.micro"
  allocated_storage      = 5
  storage_type           = "gp2"
  skip_final_snapshot    = true
  db_subnet_group_name   = aws_db_subnet_group.tfdemo.id
  vpc_security_group_ids = [var.tfdemo-rds-sg]
  parameter_group_name   = "default.mysql5.7"
  multi_az = true
  storage_encrypted = true
  tags = {
    Name = "wp-rds"
  }
}

resource "aws_db_subnet_group" "tfdemo" {
  name       = "tfdemo"
  subnet_ids = [var.private-subnet1-id, var.private-subnet2-id]

  tags = {
    Name = "tfdemo"
  }
}
