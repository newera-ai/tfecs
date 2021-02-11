#security group for Bastion
resource "aws_security_group" "tfdemo-bastion" {
  name        = "tfdemo-bastion"
  description = "Allows incoming traffic for Bastion"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  vpc_id = var.vpc_id

  tags = {
    Name = "tfdemo-bastion"
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

#security group for ELB
resource "aws_security_group" "tfdemo-elb" {
  name        = "tfdemo-elb"
  description = "Allows incoming traffic for ELB"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  vpc_id = var.vpc_id

  tags = {
    Name = "tfdemo-elb"
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

#security group for ECS
resource "aws_security_group" "tfdemo-ecs-wp" {
  name        = "tfdemo-ecs-wp"
  description = "Allows incoming traffic from ELB and Bastion "

  ingress {
    from_port       = 22
    to_port         = 22
    protocol        = "tcp"
    security_groups = ["${aws_security_group.tfdemo-bastion.id}"]
  }

  ingress {
    from_port       = 80
    to_port         = 80
    protocol        = "tcp"
    security_groups = ["${aws_security_group.tfdemo-elb.id}"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  vpc_id = var.vpc_id

  tags = {
    Name = "tfdemo-ecs-wp"
  }

}

# SECURITY GROUP TO ALLOW ACCESS TO THE RDS 
resource "aws_security_group" "tfdemo-rds" {
  name = "tfdemo-rds"

  ingress {
    from_port       = 3306
    to_port         = 3306
    protocol        = "tcp"
    security_groups = ["${aws_security_group.tfdemo-bastion.id}", "${aws_security_group.tfdemo-ecs-wp.id}"]
  }

  vpc_id = var.vpc_id

  tags = {
    Name = "tfdemo-rds"
  }
}