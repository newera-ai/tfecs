output "ecs-instance-profile_id" {
  value = aws_iam_instance_profile.ecs-instance-profile.id
}

output "ecs-service-role_name" {
  value = aws_iam_role.ecs-service-role.name
}