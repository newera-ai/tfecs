module "cluster" {
  source           = "./cluster"
  ecs_cluster_name = var.ecs_cluster_name
}

module "service" {
  source                  = "./service"
  ecs-service-role_name   = var.ecs-service-role_name
  wp-cluster_id           = module.cluster.wp-cluster_id
  wordpress_family        = module.task-defination.wordpress_family
  data_wordpress_revision = module.task-defination.data_wordpress_revision
  wordpress_revision      = module.task-defination.wordpress_revision
  ecs-target-group_arn    = var.ecs-target-group_arn
  wp_rds_host             = var.wp_rds_host
}

module "task-defination" {
  source      = "./task-defination"
  wp_rds_host = var.wp_rds_host
}