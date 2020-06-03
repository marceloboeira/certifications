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

## Subnets
resource "aws_subnet" "custom_a" {
  vpc_id            = aws_vpc.custom.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "eu-central-1a"

  # Publicly accesible
  map_public_ip_on_launch = true

  tags = {
    Name = "10.0.1.0/24 - CustomA"
  }
}

resource "aws_subnet" "custom_b" {
  vpc_id            = aws_vpc.custom.id
  cidr_block        = "10.0.2.0/24"
  availability_zone = "eu-central-1b"

  # Publicly accesible
  map_public_ip_on_launch = false

  tags = {
    Name = "10.0.2.0/24 - CustomB"
  }
}

## Internet Gateway
resource "aws_internet_gateway" "custom" {
  vpc_id = aws_vpc.custom.id

  tags = {
    Name = "CustomInternetGateway"
  }
}

## Route Tables
resource "aws_route_table" "custom_public" {
  vpc_id = aws_vpc.custom.id

  # Note that the default route, mapping the VPC's CIDR block to "local", is created implicitly and cannot be specified.
  # https://www.terraform.io/docs/providers/aws/r/route_table.html

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.custom.id
  }

  route {
    ipv6_cidr_block = "::/0"
    gateway_id      = aws_internet_gateway.custom.id
  }

  tags = {
    Name = "CustomPublicRouteTable"
  }
}

## Associate the Public Subnet to the Public Route Table
resource "aws_route_table_association" "a" {
  subnet_id      = aws_subnet.custom_a.id
  route_table_id = aws_route_table.custom_public.id
}
