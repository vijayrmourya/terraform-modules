resource "aws_vpc" "vpc_tf" {
  cidr_block = var.vpc_cidr
  instance_tenancy = var.vpc_instance_tenancy

  tags = var.vpc_tags
}

