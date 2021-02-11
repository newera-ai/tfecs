# Creation of ASG for ECS cluster
resource "aws_autoscaling_group" "ecs-autoscaling-group" {
  name                 = "ecs-autoscaling-group"
  max_size             = var.max_instance_size
  min_size             = var.min_instance_size
  desired_capacity     = var.desired_capacity
  vpc_zone_identifier  = [var.private-subnet1-id, var.private-subnet2-id]
  launch_configuration = aws_launch_configuration.ecs-launch-configuration.name
  health_check_type    = "ELB"
  tags = [
    {
      key                 = "Name"
      value               = "wordpress"
      propagate_at_launch = true
    },
  ]
  # depends_on = [
  # var.wp-cluster_id,
  # ]
}


resource "aws_launch_configuration" "ecs-launch-configuration" {
  name_prefix          = "ecs-launch-configuration-"
  image_id             = "ami-08fcbb6bcfbc5ced8"
  instance_type        = "t2.micro"
  iam_instance_profile = var.ecs-instance-profile_id

  root_block_device {
    volume_type           = "standard"
    volume_size           = 30
    delete_on_termination = true
  }

  lifecycle {
    create_before_destroy = true
  }

  security_groups = [var.tfdemo-ecs-wp-sg]
  # associate_public_ip_address = "true"
  key_name  = var.pem_key_name
  user_data = <<EOF
#!/bin/bash
echo ECS_CLUSTER=${var.ecs_cluster_name} >> /etc/ecs/ecs.config                               
EOF

}