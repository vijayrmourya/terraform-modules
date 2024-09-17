output "instance_id" {
  value = aws_instance.ec2-instance.id
}

output "instance_public_ip" {
  value = aws_instance.ec2-instance.public_ip
}

output "private_key_out_path" {
  value = var.local_file_private_key_filename
}