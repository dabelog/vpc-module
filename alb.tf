resource "aws_lb" "test" {
  name               = "test-lb-tf"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.allow_tls.id]
  subnets            = [aws_subnet.public_subnet.id]

  enable_deletion_protection = true

  access_logs {
    bucket  = aws_s3_bucket.alb_log_bucket.id
    prefix  = "alb"
    enabled = true
  }

  tags = {
    Environment = "production"
  }
}



resource "aws_s3_bucket" "alb_log_bucket" {
  bucket = "alb_log_bucket"
  tags   = {
    Name = "My bucket"
  }
}
