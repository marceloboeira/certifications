# Default VPC Frankfurt
data "aws_vpc" "main" {
  id = "${var.vpc_id}"
}

# Default VPC Ireland - Replica
data "aws_vpc" "main_replica" {
  provider = aws.eu_west_1
  id       = "${var.vpc_replica_id}"
}
