resource "aws_internet_gateway" "module_igw" {
  vpc_id = aws_vpc.module_vpc.id

  tags = var.igw_tags
}
