# Default VPC Frankfurt
data "aws_vpc" "main" {
  id = var.vpc_id
}

data "aws_subnet" "frankfurt_main_a" {
  vpc_id = data.aws_vpc.main.id

  filter {
    name   = "availability-zone"
    values = ["eu-central-1a"]
  }
}

data "aws_subnet" "frankfurt_main_b" {
  vpc_id = data.aws_vpc.main.id

  filter {
    name   = "availability-zone"
    values = ["eu-central-1b"]
  }
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
resource "aws_default_route_table" "custom_default" {
  default_route_table_id = aws_vpc.custom.default_route_table_id

  # Remove the route to test the VPC Endpoint
  # route {
  #   cidr_block     = "0.0.0.0/0"
  #   nat_gateway_id = aws_nat_gateway.custom.id
  # }
}

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

## Associate Tables and Subnets
resource "aws_route_table_association" "a" {
  subnet_id      = aws_subnet.custom_a.id
  route_table_id = aws_route_table.custom_public.id
}

## NAT Gateways
resource "aws_nat_gateway" "custom" {
  allocation_id = aws_eip.nat.id
  subnet_id     = aws_subnet.custom_a.id
}

resource "aws_eip" "nat" {
  vpc = true
}

## Network ACL
resource "aws_default_network_acl" "default" {
  default_network_acl_id = aws_vpc.custom.default_network_acl_id
  subnet_ids             = [aws_subnet.custom_a.id, aws_subnet.custom_b.id]

  ingress {
    protocol   = -1
    rule_no    = 100
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
    icmp_type  = 0
    icmp_code  = 0
  }

  ingress {
    protocol        = -1
    rule_no         = 101
    action          = "allow"
    ipv6_cidr_block = "::/0"
    from_port       = 0
    to_port         = 0
    icmp_type       = 0
    icmp_code       = 0
  }

  egress {
    protocol   = -1
    rule_no    = 100
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
    icmp_type  = 0
    icmp_code  = 0
  }

  egress {
    protocol        = -1
    rule_no         = 101
    action          = "allow"
    ipv6_cidr_block = "::/0"
    from_port       = 0
    to_port         = 0
    icmp_type       = 0
    icmp_code       = 0
  }
}

resource "aws_network_acl" "custom" {
  vpc_id     = aws_vpc.custom.id
  subnet_ids = []

  ingress {
    protocol   = "tcp"
    rule_no    = 100
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 80
    to_port    = 80
  }

  ingress {
    protocol   = "tcp"
    rule_no    = 200
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 22
    to_port    = 22
  }

  ingress {
    protocol   = "tcp"
    rule_no    = 300
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 1024
    to_port    = 65535
  }

  egress {
    protocol   = "tcp"
    rule_no    = 100
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 80
    to_port    = 80
  }

  egress {
    protocol   = "tcp"
    rule_no    = 200
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 22
    to_port    = 22
  }

  egress {
    protocol   = "tcp"
    rule_no    = 300
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 1024
    to_port    = 65535
  }

  tags = {
    Name = "CustomACL"
  }
}

## VPC Endpoint
resource "aws_vpc_endpoint" "s3" {
  vpc_id       = aws_vpc.custom.id
  service_name = "com.amazonaws.eu-central-1.s3"
}

resource "aws_vpc_endpoint_route_table_association" "private_s3" {
  vpc_endpoint_id = aws_vpc_endpoint.s3.id
  route_table_id  = aws_default_route_table.custom_default.id
}
