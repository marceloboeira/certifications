# Security Group for EC2
resource "aws_security_group" "ec2" {
  name        = "allow-web-ssh-nfs"
  description = "allow-web-ssh-nfs"
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

  ingress {
    description = "NFS"
    from_port   = 2049
    to_port     = 2049
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

## EFS Example
resource "aws_efs_file_system" "efs_volume" {
  creation_token = "efs-volume"

  tags = {
    Name = "SharedAcrossInstances"
  }
}

# Mounting the EFS to the EC2 Instance
resource "aws_efs_mount_target" "efs_volume_mount" {
  file_system_id  = aws_efs_file_system.efs_volume.id
  subnet_id       = aws_instance.web_server.subnet_id
  security_groups = [aws_security_group.ec2.id]
}

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
  disable_api_termination = false

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

yum install amazon-efs-utils -y
echo "<h1>Server 1 - eu-central-1 - Frankfurt</h1>" > /var/www/html/index.html

aws s3 mb s3://random-bucket-202005192317
aws s3 cp /var/www/html/index.html s3://random-bucket-202005192317/index.html

EOF
}

#########################

# Security Group for EC2
resource "aws_security_group" "ec2_replica" {
  provider    = aws.eu_west_1
  name        = "allow-web-ssh"
  description = "allow-web-ssh"
  vpc_id      = data.aws_vpc.main_replica.id

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

data "aws_ami" "aws_linux_2_replica" {
  provider = aws.eu_west_1

  filter {
    name   = "image-id"
    values = ["ami-0ea3405d2d2522162"]
  }

  owners = ["amazon"]
}

# SSH Keys
resource "aws_key_pair" "ec2_replica" {
  provider   = aws.eu_west_1
  key_name   = "ec2-main-key"
  public_key = var.ec2_public_ssh_key
}

# EC2 Web Server (In Another Region)
resource "aws_instance" "web_server_replica" {
  provider      = aws.eu_west_1
  ami           = data.aws_ami.aws_linux_2_replica.id
  instance_type = "t2.micro"

  # Accidental Termination Protection
  # https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/terminating-instances.html#Using_ChangingDisableAPITermination
  disable_api_termination = false

  # Security Groups
  security_groups = [aws_security_group.ec2_replica.name]

  # SSH Key
  key_name = aws_key_pair.ec2_replica.key_name

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

echo "<h1>Server 2 - eu-west-1 - Ireland </h1>" > /var/www/html/index.html

EOF
}


####### VPC Related EC2s ########
#
# Security Group for Public EC2
resource "aws_security_group" "ec2_vpc" {
  name        = "allow-web-ssh-private"
  description = "allow-web-ssh-private"
  vpc_id      = aws_vpc.custom.id

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

# Security Group for Private EC2
resource "aws_security_group" "ec2_vpc_private" {
  name        = "allow-db"
  description = "allow-db"
  vpc_id      = aws_vpc.custom.id

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["10.0.1.0/24"]
  }

  ingress {
    description = "HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["10.0.1.0/24"]
  }

  ingress {
    description = "MySQL"
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["10.0.1.0/24"]
  }

  ingress {
    description = "ping"
    # https://www.iana.org/assignments/protocol-numbers/protocol-numbers.xhtml
    protocol    = "icmp"
    from_port   = -1
    to_port     = -1
    cidr_blocks = ["10.0.1.0/24"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# EC2 on Public VPC - Web Server
resource "aws_instance" "public_web_server" {
  ami                     = data.aws_ami.aws_linux_2.id
  instance_type           = "t2.micro"
  disable_api_termination = false
  vpc_security_group_ids      = [aws_security_group.ec2_vpc.id]
  key_name                = aws_key_pair.ec2.key_name
  iam_instance_profile    = aws_iam_instance_profile.web_server_profile.name
  subnet_id               = aws_subnet.custom_a.id

  tags = {
    Name = "HelloVPC_Public"
  }

  # Startup Script
  user_data = <<EOF
#!/bin/bash

yum update -y
yum install httpd -y
service httpd start
checkconfig httpd on

echo "<h1>VPC Server 1 - eu-central-1 - Frankfurt</h1>" > /var/www/html/index.html

EOF
}

# EC2 on Public VPC - Web Server
resource "aws_instance" "private_web_server" {
  ami                     = data.aws_ami.aws_linux_2.id
  instance_type           = "t2.micro"
  disable_api_termination = false
  vpc_security_group_ids      = [aws_security_group.ec2_vpc_private.id]
  key_name             = aws_key_pair.ec2.key_name
  iam_instance_profile = aws_iam_instance_profile.web_server_profile.name
  subnet_id            = aws_subnet.custom_b.id

  tags = {
    Name = "HelloVPC_Private"
  }

  # Startup Script
  user_data = <<EOF
#!/bin/bash

yum update -y
yum install httpd -y
service httpd start
checkconfig httpd on

echo "<h1>VPC Server 2 - eu-central-1 - Frankfurt</h1>" > /var/www/html/index.html

EOF
}
