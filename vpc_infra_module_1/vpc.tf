resource "aws_vpc" "module_vpc" {
  cidr_block = var.vpc_cidr
  instance_tenancy = var.vpc_instance_tenancy

  tags = var.vpc_tags
}

