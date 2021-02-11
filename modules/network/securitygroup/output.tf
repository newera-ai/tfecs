#output_variable_bastion
output "tfdemo-bastion-sg" {
  value = aws_security_group.tfdemo-bastion.id
}

#output_variable_wp_ecs
output "tfdemo-ecs-wp-sg" {
  value = aws_security_group.tfdemo-ecs-wp.id
}

#output_variable_elb
output "tfdemo-elb-sg" {
  value = aws_security_group.tfdemo-elb.id
}

#output_variable_rds
output "tfdemo-rds-sg" {
  value = aws_security_group.tfdemo-rds.id
}