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

# SSH Keys
resource "aws_key_pair" "ec2" {
  key_name   = "ec2-main-key"
  public_key = var.ec2_public_ssh_key
}

# EBS Root Volume
#resource "aws_ebs_volume" "web_server_root" {
#  availability_zone = "eu-central-1b"
#  size              = 8
#  type              = "gp2"
#  iops              = 100
#
#  tags = {
#    Name = "WebServerRoot"
#  }
#}

# EBS Root Attachment
# resource "aws_volume_attachment" "web_server_root_attachment" {
#   device_name = "/dev/xvda"
#   volume_id   = aws_ebs_volume.web_server_root.id
#   instance_id = aws_instance.web_server.id
# }

## EBS Extra Volume 1
#resource "aws_ebs_volume" "web_server_extra" {
#  availability_zone = "eu-central-1b"
#  size              = 1
#  type              = "standard"
#
#  tags = {
#    Name = "WebServerAttachment"
#  }
#}

## EBS Extra Volume 1 Attachment
#resource "aws_volume_attachment" "web_server_extra_attachment" {
#  device_name = "/dev/sdb"
#  volume_id   = aws_ebs_volume.web_server_extra.id
#  instance_id = aws_instance.web_server.id
#}


# Allow WebServer to Use AWS Services
resource "aws_iam_instance_profile" "web_server_profile" {
  name = "web_server_profile"
  role = aws_iam_role.ec2_admin.name
}

# EC2 Web Server
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

  # IAM Permission Profile
  iam_instance_profile = aws_iam_instance_profile.web_server_profile.name

  tags = {
    Name = "HelloWorld"
  }

  # Startup Script
  user_data = <<EOF
#!/bin/bash

yum update -y
yum install httpd -y
service httpd start
checkconfig httpd on

echo "<h1>Deployed via Terraform</h1>" > /var/www/html/index.html

aws s3 mb s3://random-bucket-202005192224999
aws s3 cp /var/www/html/index.html s3://random-bucket-202005192224999/index.html

EOF
}
