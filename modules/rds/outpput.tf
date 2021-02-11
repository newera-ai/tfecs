output "wp_rds_host" {
  value = aws_db_instance.wp-rds.address
}