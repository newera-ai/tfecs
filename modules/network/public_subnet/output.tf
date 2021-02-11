#output public route table
output "public_route-table" {
  value = aws_route_table.public-rt.id
}

output "ngw-id" {
  value = aws_nat_gateway.natgw.id
}

output "public-subnet1" {
  value = aws_subnet.public-az1.id
}

output "public-subnet2" {
  value = aws_subnet.public-az2.id
}