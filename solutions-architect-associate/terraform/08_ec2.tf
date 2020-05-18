# TODO Move to VPC module
# Main VPC
data "aws_vpc" "main" {
  id = "${var.vpc_id}"
}

# Security Group for EC2
resource "aws_security_group" "ec2" {
  name        = "allow-web"
  description = "allow-web"
  vpc_id      = data.aws_vpc.main.id

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Web"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

data "aws_ami" "aws_linux_2" {
  most_recent = true

  filter {
    name   = "image-id"
    values = ["ami-076431be05aaf8080"]
  }

  owners = ["amazon"]
}

resource "aws_key_pair" "ec2" {
  key_name   = "ec2-main-key"
  public_key = var.ec2_public_ssh_key
}

resource "aws_instance" "web_server" {
  ami           = data.aws_ami.aws_linux_2.id
  instance_type = "t2.micro"

  # Accidental Termination Protection
  # https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/terminating-instances.html#Using_ChangingDisableAPITermination
  disable_api_termination = true

  # Security Groups
  security_groups = [aws_security_group.ec2.name]

  # SSH Key
  key_name = aws_key_pair.ec2.key_name

  tags = {
    Name = "HelloWorld"
  }
}
