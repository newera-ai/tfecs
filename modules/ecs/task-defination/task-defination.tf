# Wordpress task defination
data "aws_ecs_task_definition" "wordpress" {
  task_definition = aws_ecs_task_definition.wordpress.family
}

resource "aws_ecs_task_definition" "wordpress" {
  family                = "wordpress"
  container_definitions = <<DEFINATION
[
  {
    "name": "wordpress",
    "environment": [
      {
        "name": "WORDPRESS_DB_PASSWORD",
        "value": "hcxFS5o23DF48fJDW"
      },
      {
        "name": "WORDPRESS_DB_NAME",
        "value": "wp"
      },
      {
        "name": "WORDPRESS_DB_USER",
        "value": "tfdemo_user"
      },
      {
        "name": "WORDPRESS_DB_HOST",
        "value": "${var.wp_rds_host}"
      }
    ],    
    "image": "wordpress",
    "essential": true,
    "portMappings": [
      {
        "containerPort": 80,
        "protocol": "tcp",
        "hostPort": 0
      }
    ],
    "memoryReservation": 512,
    "logConfiguration": {
      "logDriver": "awslogs",
      "options": {
        "awslogs-group": "/ecs/wordpress",
        "awslogs-region": "ap-south-1",
        "awslogs-stream-prefix": "ecs"
      }
    }
  }
]
DEFINATION
  #   requiresAttributes = <<ATTRIBUTES
  # [
  #   {
  #     "targetId": null,
  #     "targetType": null,
  #     "value": null,
  #     "name": "com.amazonaws.ecs.capability.logging-driver.awslogs"
  #   },
  #   {
  #     "targetId": null,
  #     "targetType": null,
  #     "value": null,
  #     "name": "com.amazonaws.ecs.capability.docker-remote-api.1.19"
  #   }
  # ]
  # ATTRIBUTES
}