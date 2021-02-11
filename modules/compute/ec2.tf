module "findami" {
  source = "./findami"
}

module "bastion" {
  source         = "./ec2-bastion"
  key_name       = var.region-key
  ami            = module.findami.amzami
  subnet-id      = var.public-subnet1-id
  security-group = [var.tfdemo-bastion-sg]
  az             = var.az1
  env            = var.env
  # id             = var.id
  region = var.region
}

module "asg" {
  source                  = "./asg"
  pem_key_name            = var.region-key
  private-subnet1-id      = var.private-subnet1-id
  private-subnet2-id      = var.private-subnet2-id
  ecs-instance-profile_id = var.ecs-instance-profile_id
  tfdemo-elb-sg           = var.tfdemo-elb-sg
  tfdemo-ecs-wp-sg        = var.tfdemo-ecs-wp-sg
  ecs_cluster_name        = var.ecs_cluster_name
  max_instance_size       = var.max_instance_size
  min_instance_size       = var.min_instance_size
  desired_capacity        = var.desired_capacity
  wp-cluster_id           = var.wp-cluster_id
}