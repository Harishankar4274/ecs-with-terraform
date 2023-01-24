# ECS-with-Terraform

Tasks:

1. Deploy a Rest Application on AWS ECS Fargate Using Terraform.
    1. The ECS Fargate should be deployed on Private Subenet.
    2. Image should be read from ECR.

2. Create a GitHub workflow to run Terraform code

### List of created resources

1. VPC:
   1. Public Subnets
   2. Private Subnets
   3. Internet Gateway
   4. NAT Gateway
   5. Route Tables

2. Security Groups
3. IAM Role
4. Application Load Balancer
5. Elastic Container Registry
6. ECS Cluster
   1. ECS Service
   2. ECS tasks

### Following is the Demo Video
[ECS with Tearrform and GitHub Actions](./ECS-with_Terraform_demo.mkv)