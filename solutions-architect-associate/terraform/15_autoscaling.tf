resource "aws_launch_configuration" "main" {
  name_prefix          = "autoscaled-web-server-"
  image_id             = data.aws_ami.aws_linux_2.id
  instance_type        = "t2.micro"
  iam_instance_profile = aws_iam_instance_profile.web_server_profile.name
  security_groups = [
    aws_security_group.ec2.id,
  ]
  key_name = aws_key_pair.ec2.key_name

  lifecycle {
    create_before_destroy = true
  }

  user_data = <<EOF
#!/bin/bash

yum update -y
yum install httpd -y
service httpd start
checkconfig httpd on

echo "<h1>AutoScaled Server</h1>" > /var/www/html/index.html
EOF
}

resource "aws_autoscaling_group" "main" {
  name                 = "autoscaling-group"
  launch_configuration = aws_launch_configuration.main.name
  min_size             = 2
  max_size             = 10
  vpc_zone_identifier = [
    data.aws_subnet.frankfurt_main_a.id,
    data.aws_subnet.frankfurt_main_b.id,
  ]

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_autoscaling_policy" "main" {
  name                   = "autoscaling-policy"
  autoscaling_group_name = aws_autoscaling_group.main.name
  adjustment_type    = "ChangeInCapacity"
  policy_type = "TargetTrackingScaling"

  target_tracking_configuration {
    predefined_metric_specification {
      predefined_metric_type = "ASGAverageCPUUtilization"
    }

    target_value = 40.0
  }
}
