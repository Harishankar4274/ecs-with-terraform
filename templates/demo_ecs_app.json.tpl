

[
  {
    "name": "$(aws_ecr_repository)",
    "image": "${app_image}:${tag}",
    "cpu": ${fargate_cpu},
    "memory": ${fargate_memory},
    "portMappings": [
      {
        "containerPort": ${app_port},
        "hostPort": ${app_port}
      }
    ]
  }
]