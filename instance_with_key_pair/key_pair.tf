resource "tls_private_key" "key_for_instance" {
  algorithm = var.tls_private_key_algorithm
  rsa_bits  = var.tls_private_key_rsa_bits
}

resource "aws_key_pair" "key_for_instance" {
  key_name   = var.aws_key_pair_key_name
  public_key = tls_private_key.key_for_instance.public_key_openssh
}

resource "local_file" "private_key" {
  filename        = var.local_file_private_key_filename
  content         = tls_private_key.key_for_instance.private_key_pem
  file_permission = var.local_file_private_key_file_permission
}

output "key_pair_name" {
  value = aws_key_pair.key_for_instance.key_name
}

output "private_key_path" {
  value = local_file.private_key.filename
}
