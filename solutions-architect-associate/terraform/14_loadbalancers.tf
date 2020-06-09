# Elastic Load Balancer
resource "aws_elb" "classic" {
  name               = "elb-classic"
  availability_zones = [
    "eu-central-1a",
    "eu-central-1b",
  ]

  listener {
    instance_port     = 80
    instance_protocol = "http"
    lb_port           = 80
    lb_protocol       = "http"
  }

  security_groups = [
    aws_security_group.ec2.id,
  ]
  health_check {
    healthy_threshold   = 3
    unhealthy_threshold = 2
    timeout             = 3
    interval            = 5
    target              = "HTTP:80/index.html"
  }

  instances = [
    aws_instance.elb_webserver_01.id,
    aws_instance.elb_webserver_02.id,
  ]

  cross_zone_load_balancing   = true
  idle_timeout                = 400
  connection_draining         = true
  connection_draining_timeout = 400

  tags = {
    Name = "elb-classic",
  }
}

## Application Load Balancer

resource "aws_lb" "main" {
  name               = "alb-main"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [
    aws_security_group.ec2.id,
  ]

  subnets = [
    data.aws_subnet.frankfurt_main_a.id,
    data.aws_subnet.frankfurt_main_b.id,
  ]

  enable_deletion_protection = false
}

resource "aws_lb_target_group" "main_target" {
  name     = "elb-web-server-01"
  port     = 80
  protocol = "HTTP"

  vpc_id      = data.aws_vpc.main.id
  target_type = "instance"


  health_check {
    healthy_threshold   = 3
    unhealthy_threshold = 2
    timeout             = 3
    protocol            = "HTTP"
    port                = 80
    path                = "/index.html"
  }
}

resource "aws_lb_target_group_attachment" "instance_01" {
  target_group_arn = aws_lb_target_group.main_target.arn
  target_id        = aws_instance.elb_webserver_01.id
  port             = 80
}

resource "aws_lb_target_group_attachment" "instance_02" {
  target_group_arn = aws_lb_target_group.main_target.arn
  target_id        = aws_instance.elb_webserver_02.id
  port             = 80
}

resource "aws_lb_listener" "default" {
  load_balancer_arn = aws_lb.main.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.main_target.arn
  }
}
