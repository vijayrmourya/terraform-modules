output "instance_id" {
  value = aws_instance.ec2-instance.id
}

output "instance_public_ip" {
  value = aws_instance.ec2-instance.public_ip
}

output "private_key_out_path" {
  value = var.local_file_private_key_filename
}

locals {
  output_windows_pass  = local.is_it_windows ? 1: 0
}

output "windows_password" {
  value = local.is_it_windows ? rsadecrypt(aws_instance.ec2-instance.password_data, nonsensitive(tls_private_key.key_for_instance.private_key_pem)) : ""
}

