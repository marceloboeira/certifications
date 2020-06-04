resource "aws_elb" "classic" {
  name               = "elb-classic"
  availability_zones = ["eu-central-1a", "eu-central-1b"]

  listener {
    instance_port     = 80
    instance_protocol = "http"
    lb_port           = 80
    lb_protocol       = "http"
  }

  security_groups = [aws_security_group.ec2.id]
  health_check {
    healthy_threshold   = 3
    unhealthy_threshold = 2
    timeout             = 3
    interval            = 5
    target              = "HTTP:80/index.html"
  }

  instances                   = [
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
