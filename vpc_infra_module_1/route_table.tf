resource "aws_route_table" "module_routetable_public" {
  vpc_id = aws_vpc.module_vpc.id

  route {
    cidr_block = "10.0.1.0/24"
    gateway_id = aws_internet_gateway.module_igw.id
  }

  tags = {
    Name = "example"
  }
}