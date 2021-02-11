#Instance private IP
output "private_ips" {
  value = aws_instance.ec2-instance.private_ip
}

#Instance name
output "tag_name" {
  value = aws_instance.ec2-instance.tags.Name
}

#Instance ID
output "instance_id" {
  value = aws_instance.ec2-instance.id
}