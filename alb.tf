data "aws_subnet" "aws_vpc_public_subnet_1" {
  filter {
    name   = "tag:Name"
    values = [var.aws_vpc_name]
  }
  cidr_block = "192.168.11.0/24"

}

data "aws_subnet" "aws_vpc_public_subnet_2" {
  filter {
    name   = "tag:Name"
    values = [var.aws_vpc_name]
  }
  cidr_block = "192.168.12.0/24"

}

resource "aws_alb" "main" {
  name            = var.ecs_alb_name
  subnets         = [ data.aws_subnet.aws_vpc_public_subnet_1.*.id , data.aws_subnet.aws_vpc_public_subnet_2.*.id]
  security_groups = [aws_security_group.lb.id]
}

resource "aws_alb_target_group" "app" {
  name        = "demo-ecs-target-group"
  port        = 80
  protocol    = "HTTP"
  vpc_id      = module.vpc.vpc_id
  target_type = "ip"

  health_check {
    healthy_threshold   = "3"
    interval            = "30"
    protocol            = "HTTP"
    matcher             = "200"
    timeout             = "3"
    path                = var.health_check_path
    unhealthy_threshold = "2"
  }
}

# Redirect all traffic from the ALB to the target group
resource "aws_alb_listener" "front_end" {
  load_balancer_arn = aws_alb.main.id
  port              = var.app_port
  protocol          = "HTTP"

  default_action {
    target_group_arn = aws_alb_target_group.app.id
    type             = "forward"
  }
}