# Wordpress Services
resource "aws_ecs_service" "wp-service" {
  name            = "wp-service"
  iam_role        = var.ecs-service-role_name
  cluster         = var.wp-cluster_id
  task_definition = "${var.wordpress_family}:${max(var.wordpress_revision, var.data_wordpress_revision, )}"
  desired_count   = 1

  load_balancer {
    target_group_arn = var.ecs-target-group_arn
    container_port   = 80
    container_name   = "wordpress"
  }

  depends_on = [
    var.wp_rds_host
  ]
}