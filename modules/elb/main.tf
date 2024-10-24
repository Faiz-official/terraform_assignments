resource "aws_lb" "web_lb" {
  name               = "web-lb"
  load_balancer_type = "application"
  security_groups    = [var.r_web_sg_id]
  subnets            = [var.r_public_subnet_id]
}

resource "aws_lb_target_group" "web_tg" {
  name     = "web-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.r_vpc_id
}

resource "aws_lb_listener" "web_listener" {
  load_balancer_arn = aws_lb.web_lb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.web_tg.arn
  }
}
