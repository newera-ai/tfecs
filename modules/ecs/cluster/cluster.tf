# ECS Cluster for wordpress
resource "aws_ecs_cluster" "wp-cluster" {
  name = var.ecs_cluster_name
}