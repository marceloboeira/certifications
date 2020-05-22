# Security Group for ElasticCache
resource "aws_security_group" "redis" {
  name        = "allow-redis"
  description = "allow-redis"
  vpc_id      = data.aws_vpc.main.id

  ingress {
    description = "Redis"
    from_port   = 6379
    to_port     = 6379
    protocol    = "tcp"
    # Allow EC2 SG to inbound Redis
    security_groups = [aws_security_group.ec2.id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Disabled to avoid costs
# resource "aws_elasticache_cluster" "webserver_redis" {
#   cluster_id         = "webserver-redis"
#   security_group_ids = [aws_security_group.redis.id]
#
#   engine               = "redis"
#   node_type            = "cache.t2.micro"
#   num_cache_nodes      = 1
#   parameter_group_name = "default.redis3.2"
#   engine_version       = "3.2.10"
#   port                 = 6379
# }
