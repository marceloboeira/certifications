# Security Group for RDS
resource "aws_security_group" "mysql" {
  name        = "allow-mysql"
  description = "allow-mysql"
  vpc_id      = data.aws_vpc.main.id

  ingress {
    description = "MySQL"
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    # Allow EC2 SG to inbound MySQL
    security_groups = [aws_security_group.ec2.id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Database RDS, Uncomment if you want to run it
# resource "aws_db_instance" "web_server_mysql" {
#   identifier = "ninenine"
#   name       = "ninenine"
#   username   = "noice"
#   password   = "toits-99"
#
#   engine               = "mysql"
#   engine_version       = "5.7"
#   parameter_group_name = "default.mysql5.7"
#
#   instance_class          = "db.t2.micro"
#   allocated_storage       = 20
#   storage_type            = "gp2"
#   apply_immediately       = true
#   backup_retention_period = 0
#
#   publicly_accessible    = true
#   vpc_security_group_ids = [aws_security_group.mysql.id]
#   multi_az               = true
# }


# data "aws_subnet_ids" "main" {
#   vpc_id = data.aws_vpc.main.id
# }
#
# module "aurora_read_replica" {
#   source  = "terraform-aws-modules/rds-aurora/aws"
#   version = "~> 2.0"
#
#   replication_source_identifier = aws_db_instance.web_server_mysql.arn
#
#   name          = "ninenine-read-replica"
#   engine        = "aurora-mysql"
#   replica_count = 1
#
#   vpc_id                  = data.aws_vpc.main.id
#   subnets                 = data.aws_subnet_ids.main.ids
#   allowed_security_groups = [aws_security_group.mysql.id]
#
#   skip_final_snapshot = true
#   instance_type       = "db.t2.micro"
#   storage_encrypted   = false
#   apply_immediately   = true
# }
