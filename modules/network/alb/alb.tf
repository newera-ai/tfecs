resource "aws_alb" "ecs-load-balancer" {
  name            = "ecs-load-balancer"
  security_groups = [var.tfdemo-elb-sg]
  subnets         = [var.public-subnet1-id, var.public-subnet2-id]

  tags = {
    Name = "ecs-alb"
  }
}

resource "aws_alb_target_group" "ecs-target-group" {
  name     = "ecs-target-group"
  port     = "80"
  protocol = "HTTP"
  vpc_id   = var.vpc_id

  health_check {
    healthy_threshold   = "5"
    unhealthy_threshold = "2"
    interval            = "30"
    matcher             = "200"
    path                = "/"
    port                = "traffic-port"
    protocol            = "HTTP"
    timeout             = "5"
  }

  tags = {
    Name = "ecs-target-group"
  }
}

# Listener
resource "aws_alb_listener" "http" {
  load_balancer_arn = aws_alb.ecs-load-balancer.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    target_group_arn = aws_alb_target_group.ecs-target-group.id
    type             = "forward"
  }

  # # To enable http to https # #s
  # default_action {
  #   type = "redirect"

  #   redirect {
  #     port        = 443
  #     protocol    = "HTTPS"
  #     status_code = "HTTP_301"
  #   }
  # }
}

# # Redirect traffic to target group
# resource "aws_alb_listener" "https" {
#     load_balancer_arn = aws_alb.ecs-load-balancer.arn
#     port              = 443
#     protocol          = "HTTPS"

#     ssl_policy        = "ELBSecurityPolicy-2016-08"
#     certificate_arn   = var.alb_tls_cert_arn

#     default_action {
#         target_group_arn = aws_alb_target_group.ecs-target-group.arn
#         type             = "forward"
#     }
# }