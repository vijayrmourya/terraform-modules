variable "vpc_cidr" {
  type = string
}

variable "vpc_instance_tenancy" {
  type = string
}

variable "vpc_tags" {
  type = map(string)
}

variable "pubsub_1_cidr" {
  type = string
}

variable "pubsub_1_az" {
  type = string
}

variable "pubsub_1_tags" {
  type = map(string)
}

variable "pubsub_2_cidr" {
  type = string
}

variable "pubsub_2_az" {
  type = string
}

variable "pubsub_2_tags" {}

variable "igw_tags" {
  type = map(string)
}
