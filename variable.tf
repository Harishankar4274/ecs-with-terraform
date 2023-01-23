variable "aws_region" {
  description = "Add AWS region."
  default     = "ap-south-1"
  type        = string
}

# variable "aws_profile" {
#   type        = string
#   description = "Add your profile configured with AWS CLI to login."
#   default     = "default"
# }

variable "aws_vpc_name" {
  type        = string
  description = "Add name for your VPC."
  default     = "demo_ecs_vpc"
}

variable "aws_vpc_cidr" {
  type        = string
  description = "Add CIDR block for your VPC."
  default     = "192.168.0.0/16"
}

variable "aws_vpc_azs" {
  type        = list(string)
  description = "Add list of AZs available in the region that you want to use. Example ['ap-south-1a', 'ap-south-1b', 'ap-south-1c']"
  default     = ["ap-south-1a"]
}

variable "aws_vpc_private_subnets" {
  type        = list(string)
  description = "Add list of CIDR locks for private subnets in the vpc. Example ['192.168.1.0/24','192.168.2.0/24','192.168.3.0/24']"
  default     = ["192.168.1.0/24"]
}

variable "aws_vpc_public_subnets" {
  type        = list(string)
  description = "Add list of CIDR locks for public subnets in the vpc. Example ['192.168.11.0/24','192.168.12.0/24','192.168.13.0/24']"
  default     = ["192.168.11.0/24"]
}

variable "enable_nat_gateway" {
  type        = bool
  description = "Enable or disable the NAT gateway. Enter a boolean value 'true' or 'false'."
  default     = true
}

variable "environment" {
  type        = string
  description = "Add the environment name"
  default     = "demo"
}

variable "ecs_iam_role_name" {
  type        = string
  description = "Enter a name for the ECS IAM Role"
  default     = "ecsTaskExecutionRole"
}

variable "aws_ecs_cluster_name" {
  type        = string
  description = "Enter a name for ECS cluster"
  default     = "demo-ecs-cluster"
}

variable "aws_ecr_repository" {
  type        = string
  description = "ECR repo name"
  default     = "demo_ecs_app"
}

variable "aws_ecs_task_def_fam" {
  type        = string
  description = "demo_ecs_fam"
  default     = "demo_ecs_fam"
}

variable "fargate_cpu" {
  type        = number
  description = "enter required number of cpus"
  default     = 1
}

variable "fargate_memory" {
  type        = string
  description = "Enter required memory"
  default     = "2Gi"
}

variable "aws_ecs_service_name" {
  type        = string
  description = "service name"
  default     = "demo_ecs_svc"
}

variable "app_port" {
  type        = number
  description = "Port number of the application contianer"
  default     = 80
}

variable "app_count" {
  type        = numberm
  description = "Number of replicas of the pod"
  default     = 2
}

variable "ecs_alb_name" {
  type        = string
  description = "ALB Name"
  default     = "demo_ecs_alb"
}