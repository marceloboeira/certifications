# Default VPC Frankfurt
data "aws_vpc" "main" {
  id = "${var.vpc_id}"
}

# Default VPC Ireland - Replica
data "aws_vpc" "main_replica" {
  provider = aws.eu_west_1
  id       = "${var.vpc_replica_id}"
}

# Custom VPC
resource "aws_vpc" "custom" {
  # Biggest Range Allowed
  cidr_block = "10.0.0.0/16"

  assign_generated_ipv6_cidr_block = true

  tags = {
    Name = "CustomVPC"
  }
}

## Subnet

resource "aws_subnet" "custom_a" {
  vpc_id            = aws_vpc.custom.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "eu-central-1a"

  # Publicly accesible
  map_public_ip_on_launch = true

  tags = {
    Name = "10.0.1.0/24 - custom_a"
  }
}


resource "aws_subnet" "custom_b" {
  vpc_id            = aws_vpc.custom.id
  cidr_block        = "10.0.2.0/24"
  availability_zone = "eu-central-1b"

  # Publicly accesible
  map_public_ip_on_launch = true

  tags = {
    Name = "10.0.2.0/24 - custom_b"
  }
}
