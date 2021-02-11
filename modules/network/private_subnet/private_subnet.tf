# Private subnet creation
resource "aws_subnet" "private-az1" {
  #region  = "${var.region}"  
  vpc_id            = var.vpc_id
  cidr_block        = var.cidr-az1
  availability_zone = var.az1

  tags = {
    Name = "${var.private_subnet_name-az1}"
  }

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_subnet" "private-az2" {
  vpc_id            = var.vpc_id
  cidr_block        = var.cidr-az2
  availability_zone = var.az2

  tags = {
    Name = "${var.private_subnet_name-az2}"
  }

  lifecycle {
    create_before_destroy = true
  }
}

#route_table creation

resource "aws_route_table" "private-rt" {
  vpc_id = var.vpc_id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = var.ngw-id
  }

  tags = {
    Name = "routetable-private"
  }

  lifecycle {
    create_before_destroy = true
  }
}

# AZ1 route_table association
resource "aws_route_table_association" "private-az1" {
  subnet_id      = aws_subnet.private-az1.id
  route_table_id = aws_route_table.private-rt.id

  lifecycle {
    create_before_destroy = true
  }
}

# AZ2 route_table association
resource "aws_route_table_association" "private-az2" {
  subnet_id      = aws_subnet.private-az2.id
  route_table_id = aws_route_table.private-rt.id

  lifecycle {
    create_before_destroy = true
  }
}