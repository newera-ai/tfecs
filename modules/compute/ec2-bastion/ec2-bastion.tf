#EC2 instance creation with setting hostname using user-data
resource "aws_instance" "ec2-instance" {
  key_name               = var.key_name
  subnet_id              = var.subnet-id
  vpc_security_group_ids = var.security-group
  ami                    = var.ami
  instance_type          = var.instance-type
  availability_zone      = var.az

  tags = {
    Name = "${var.env}-${var.az}-bastion"
  }

  lifecycle {
    create_before_destroy = true
  }

  root_block_device {
    volume_type           = "gp2"
    delete_on_termination = true
  }
}