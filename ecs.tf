resource "aws_ecs_cluster" "ecs-cluster" {
  name = var.aws_ecs_cluster_name
}

data "template_file" "demo_ecs_app" {
  template = file("./templates/demo_ecs_app.json.tpl")
  vars = {
    app_image      = aws_ecr_repository.demo_ecs_app.repository_url
    app_port       = var.app_port
    fargate_cpu    = var.fargate_cpu
    fargate_memory = var.fargate_memory
    tag            = var.tag
    name           = var.aws_ecr_repository
  }
}


# data "aws_subnet" "aws_vpc_private_subnets" {
#   filter {
#     name   = "tag:Name"
#     values = [var.aws_vpc_name]
#   }
#   cidr_block = "192.168.1.0/24"

# }

resource "aws_ecs_task_definition" "demo_ecs_app_def" {

  family                   = var.aws_ecs_task_def_fam
  execution_role_arn       = aws_iam_role.ecs_task_execution_role.arn
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu                      = var.fargate_cpu
  memory                   = var.fargate_memory
  #   container_definitions    = data.template_file.demo_ecs_app.render
  container_definitions = jsonencode([
    {
      name   = var.aws_ecr_repository
      image  = "600023384173.dkr.ecr.ap-south-1.amazonaws.com/demo_ecs_app:latest"
      cpu    = var.fargate_cpu
      memory = var.fargate_memory
      portMappings = [
        {
          containerPort = var.app_port
          hostPort      = var.app_port
        }
      ]
    }
  ])
}

resource "aws_ecs_service" "main" {
  name            = var.aws_ecs_service_name
  cluster         = aws_ecs_cluster.ecs-cluster.id
  task_definition = aws_ecs_task_definition.demo_ecs_app_def.arn
  desired_count   = var.app_count
  launch_type     = "FARGATE"

  network_configuration {
    security_groups  = [aws_security_group.ecs_task.id]
    subnets          = module.vpc.private_subnets
    assign_public_ip = true
  }

  load_balancer {
    target_group_arn = aws_alb_target_group.app.id
    container_port   = var.app_port
    container_name   = var.aws_ecr_repository
  }

  depends_on = [
    aws_ecr_repository.demo_ecs_app,
    aws_ecs_task_definition.demo_ecs_app_def,
    module.vpc
  ]

}