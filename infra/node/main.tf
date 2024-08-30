variable "private_key_name" {}
variable "private_key_path" {}
variable "ami_id" {}
variable "instance_type" {}
variable "tag_name" {}
variable "public_key" {}
variable "subnet_id" {}
variable "sg_for_node" {}
variable "enable_public_ip_address" {}
variable "user_data_install_node" {}

output "node_ec2_instance_id" {
  value = aws_instance.node_ec2_instance_ip.id
}

output "dev_proj_ec2_instance_public_ip" {
  value = aws_instance.node_ec2_instance_ip.public_ip
}

resource "aws_instance" "node_ec2_instance_ip" {
  ami           = var.ami_id
  instance_type = var.instance_type
  tags = {
    Name = var.tag_name
  }
  key_name                    = var.private_key_name
  subnet_id                   = var.subnet_id
  vpc_security_group_ids      = var.sg_for_node
  associate_public_ip_address = var.enable_public_ip_address

  user_data = var.user_data_install_node

  metadata_options {
    http_endpoint = "enabled"  # Enable the IMDSv2 endpoint
    http_tokens   = "required" # Require the use of IMDSv2 tokens
  }
}

resource "aws_key_pair" "node_ec2_instance_public_key" {
  key_name   = var.private_key_name
  public_key = var.public_key
}