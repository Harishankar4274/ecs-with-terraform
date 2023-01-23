data "aws_vpc" "demo_ecs_vpc" {
    name = var.aws_vpc_name  
}

resource "aws_security_group" "lb" {
  name = var.aws_sg_name
  vpc_id = data.aws_vpc.demo_ecs_vpc.id

  ingress = [ {
    cidr_blocks = ["0.0.0.0/0"]
    from_port = var.app_port
    protocol = "tcp"
    to_port = var.app_port
  } ]

  egress = [ {
    cidr_blocks = [ "0.0.0.0/0" ]
    from_port = 0
    protocol = "-1"
    to_port = 0
  } ]
}

resource "aws_security_group" "ecs_task" {
  name = "demo_ecs_task_sg"
  vpc_id = data.aws_vpc.demo_ecs_vpc.id

  ingress = [ {
    from_port = var.app_port
    protocol = "tcp"
    security_groups = [ aws_security_group.lb.id ]
    to_port = var.app_port
  } ]

  egress = [ {
    cidr_blocks = [ "0.0.0.0/0" ]
    from_port = 0
    protocol = "-1"
    to_port = 0
  } ]
}