# instance related variables
variable "ami_id" {
  description = "AWS EC2 AMI id"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance size to be created"
  type        = string
}

variable "instance_tags" {
  default = {}
}

variable "associate_public_ip_address_setting" {
  type = bool
}

variable "user_data_script_path" {
  description = "user data script path"
  type        = string
}

# Security group variables
variable "security_group_name" {
  description = "Name of the security group"
  type        = string
}

variable "security_group_description" {
  description = "Description of the security group"
  type        = string
  default     = "Security group managed by Terraform"
}

variable "vpc_id" {
  description = "The VPC ID where the security group will be created"
  type        = string
}

variable "ingress_rules" {
  description = "List of ingress rules"
  type = list(
    object({
      from_port   = number
      to_port     = number
      protocol    = string
      cidr_blocks = list(string)
      description = optional(string)
    })
  )
  default = []
}

variable "egress_rules" {
  description = "List of egress rules"
  type = list(
    object({
      from_port   = number
      to_port     = number
      protocol    = string
      cidr_blocks = list(string)
      description = optional(string)
    })
  )
  default = []
}

variable "sg_tags" {
  description = "Tags to apply to the security group"
  default     = {}
}

# key pair variables
variable "tls_private_key_algorithm" {
  type = string
}
variable "tls_private_key_rsa_bits" {
  type = string
}
variable "aws_key_pair_key_name" {
  type = string
}
variable "local_file_private_key_filename" {
  type = string
}
variable "local_file_private_key_file_permission" {
  type = string
}
