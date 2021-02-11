# Private RouteTable id
output "private_route-table" {
  value = aws_route_table.private-rt.id
}

output "private-subnet1" {
  value = aws_subnet.private-az1.id
}

output "private-subnet2" {
  value = aws_subnet.private-az2.id
}