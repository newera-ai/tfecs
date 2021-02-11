output "wordpress_family" {
  value = aws_ecs_task_definition.wordpress.family
}

output "data_wordpress_revision" {
  value = data.aws_ecs_task_definition.wordpress.revision
}

output "wordpress_revision" {
  value = aws_ecs_task_definition.wordpress.revision
}