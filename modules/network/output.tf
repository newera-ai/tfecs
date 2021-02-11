# VPC
output "vpc_id" {
  value = module.vpc.vpc_id
}

output "vpc_cidr" {
  value = module.vpc.vpc_cidr
}

output "private-subnet1-id" {
  value = module.private_subnet.private-subnet1
}

output "private-subnet2-id" {
  value = module.private_subnet.private-subnet2
}

output "public-subnet1-id" {
  value = module.public_subnet.public-subnet1
}

output "public-subnet2-id" {
  value = module.public_subnet.public-subnet2
}

output "tfdemo-bastion-sg" {
  value = module.securitygroup.tfdemo-bastion-sg
}

output "tfdemo-ecs-wp-sg" {
  value = module.securitygroup.tfdemo-ecs-wp-sg
}

output "tfdemo-elb-sg" {
  value = module.securitygroup.tfdemo-elb-sg
}

output "tfdemo-rds-sg" {
  value = module.securitygroup.tfdemo-rds-sg
}

output "ecs-target-group_arn" {
  value = module.alb.ecs-target-group_arn
}