module "network" {
  source                  = "./modules/network"
  vpc_cidr                = var.vpc_cidr
  private_subnet_cidr-az1 = var.private_subnet_cidr-az1
  private_subnet_name-az1 = var.private_subnet_name-az1
  public_subnet_cidr-az1  = var.public_subnet_cidr-az1
  public_subnet_name-az1  = var.public_subnet_name-az1
  public_subnet_cidr-az2  = var.public_subnet_cidr-az2
  public_subnet_name-az2  = var.public_subnet_name-az2
  private_subnet_cidr-az2 = var.private_subnet_cidr-az2
  private_subnet_name-az2 = var.private_subnet_name-az2
  region                  = var.region
  az1                     = var.region-az1
  az2                     = var.region-az2
  env                     = var.env
  vpc_name                = var.vpc_name
}

module "compute" {
  source = "./modules/compute"
  region = var.region
  env    = var.env
  # id                      = var.id
  az1                     = var.region-az1
  az2                     = var.region-az2
  region-key              = var.region-key
  private-subnet1-id      = module.network.private-subnet1-id
  private-subnet2-id      = module.network.private-subnet2-id
  public-subnet1-id       = module.network.public-subnet1-id
  public-subnet2-id       = module.network.public-subnet2-id
  tfdemo-bastion-sg       = module.network.tfdemo-bastion-sg
  ecs-instance-profile_id = module.iam.ecs-instance-profile_id
  tfdemo-ecs-wp-sg        = module.network.tfdemo-ecs-wp-sg
  tfdemo-elb-sg           = module.network.tfdemo-elb-sg
  ecs_cluster_name        = var.ecs_cluster_name
  max_instance_size       = var.max_instance_size
  min_instance_size       = var.min_instance_size
  desired_capacity        = var.desired_capacity
  wp-cluster_id           = module.ecs.wp-cluster_id
}

module "ecs" {
  source                = "./modules/ecs"
  region                = var.region
  ecs_cluster_name      = var.ecs_cluster_name
  ecs-service-role_name = module.iam.ecs-service-role_name
  ecs-target-group_arn  = module.network.ecs-target-group_arn
  wp_rds_host           = module.rds.wp_rds_host
}

module "iam" {
  source = "./modules/iam"
}

module "rds" {
  source             = "./modules/rds"
  tfdemo-rds-sg      = module.network.tfdemo-rds-sg
  private-subnet1-id = module.network.private-subnet1-id
  private-subnet2-id = module.network.private-subnet2-id
}