resource "aws_db_instance" "mysql_db" {
  allocated_storage    = 20
  db_name             = "dummydb"
  engine              = "mysql"
  engine_version      = "8.0"
  instance_class      = "db.t2.micro"
  publicly_accessible = true
  username            = "admin"
  password            = "adminpassword"
  db_subnet_group_name = var.db_subnet_group
  vpc_security_group_ids = [var.security_group_id]

  tags = {
    Name = "mysql-db"
  }
}
