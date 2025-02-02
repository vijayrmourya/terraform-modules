resource "aws_instance" "ec2-instance" {
  ami                         = var.ami_id
  instance_type               = var.instance_type
  associate_public_ip_address = var.associate_public_ip_address_setting
  vpc_security_group_ids      = [aws_security_group.ec2_rules.id]
  key_name                    = aws_key_pair.key_for_instance.key_name
  user_data                   = file(var.user_data_script_path)

  get_password_data      = local.is_it_windows ? true : false 

  tags = var.instance_tags
}
