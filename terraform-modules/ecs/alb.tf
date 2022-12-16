resource "aws_lb" "alb" {
  name               = "${var.environment}-alb-${var.region}"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.alb.id]
  subnets            = var.subnets

  enable_deletion_protection = false
}

resource "aws_lb_target_group" "target" {
  name        = "${var.environment}-target-${var.region}"
  port        = 80
  protocol    = "HTTP"
  vpc_id      = var.vpc_id
  target_type = "ip"

  lifecycle { create_before_destroy = true }
  health_check {
    matcher = "302,200,301" # has to be HTTP 200 or fails
  }

}
resource "aws_lb_listener" "front_end" {
  load_balancer_arn = aws_lb.alb.arn
  port              = "80"
  protocol          = "HTTP"
  default_action {
    type             = "redirect"
    target_group_arn = aws_lb_target_group.target.arn
    redirect {
      port        = 443
      protocol    = "HTTPS"
      status_code = "HTTP_301"
    }
  }
}

resource "aws_lb_listener" "https" {
  load_balancer_arn = aws_lb.alb.arn
  port              = "443"
  protocol          = "HTTPS"
  certificate_arn   = aws_acm_certificate.certificate.arn
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.target.arn
  }
}
