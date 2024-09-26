resource "aws_subnet" "module_pubsub_1" {
  vpc_id     = aws_vpc.module_vpc.id
  cidr_block = var.pubsub_1_cidr
  availability_zone = var.pubsub_1_az

  tags = var.pubsub_1_tags
}

resource "aws_subnet" "module_pubsub_2" {
  vpc_id     = aws_vpc.module_vpc.id
  cidr_block = var.pubsub_2_cidr
  availability_zone = var.pubsub_2_az

  tags = var.pubsub_2_tags
}