module "networking" {
  source               = "./networking"
  vpc_cidr             = var.vpc_cidr
  vpc_name             = var.vpc_name
  cidr_public_subnet   = var.cidr_public_subnet
  eu_availability_zone = var.eu_availability_zone
  cidr_private_subnet  = var.cidr_private_subnet
}

module "security_group" {
  source              = "./security-groups"
  ec2_sg_name         = "SG for EC2 to enable SSH(22), HTTPS(443) and HTTP(80)"
  vpc_id              = module.networking.dev_proj_1_vpc_id
  ec2_node_sg_name = "Allow port 9000 for node"
}
module "node" {
  source                    = "./node"
  ami_id                    = var.ec2_ami_id
  instance_type             = "t2.medium"
  tag_name                  = "node:Ubuntu Linux EC2"
  public_key                = var.public_key
  subnet_id                 = tolist(module.networking.dev_proj_1_public_subnets)[0]
  sg_for_node            = [module.security_group.sg_ec2_sg_ssh_http_id, module.security_group.sg_ec2_node_port_9000]
  enable_public_ip_address  = true
  user_data_install_node = templatefile("./template/node-installer.sh", {})
}

module "lb_target_group" {
  source                   = "./load-balancer-target-group"
  lb_target_group_name     = "node-lb-target-group"
  lb_target_group_port     = 9000
  lb_target_group_protocol = "HTTP"
  vpc_id                   = module.networking.dev_proj_1_vpc_id
  ec2_instance_id          = module.node.node_ec2_instance_ip
}

module "alb" {
  source                    = "./load-balancer"
  lb_name                   = "dev-proj-1-alb"
  is_external               = false
  lb_type                   = "application"
  sg_enable_ssh_https       = module.security_group.sg_ec2_sg_ssh_http_id
  subnet_ids                = tolist(module.networking.dev_proj_1_public_subnets)
  tag_name                  = "dev-proj-1-alb"
  lb_target_group_arn       = module.lb_target_group.dev_proj_1_lb_target_group_arn
  ec2_instance_id           = module.node.node_ec2_instance_ip
  lb_listner_port           = 80
  lb_listner_protocol       = "HTTP"
  lb_listner_default_action = "forward"
  lb_https_listner_port     = 443
  lb_https_listner_protocol = "HTTPS"
  dev_proj_1_acm_arn        = module.aws_ceritification_manager.dev_proj_1_acm_arn
  lb_target_group_attachment_port = 9000
}

module "hosted_zone" {
  source          = "./hosted-zone"
  domain_name     = var.domain_name
  endpoint_name     = var.endpoint_name
  aws_lb_dns_name = module.alb.aws_lb_dns_name
  aws_lb_zone_id  = module.alb.aws_lb_zone_id
}

module "aws_ceritification_manager" {
  source         = "./certificate-manager"
  endpoint_name    = var.endpoint_name
  hosted_zone_id = module.hosted_zone.hosted_zone_id
}

# module "rds_db_instance" {
#   source               = "./rds"
#   db_subnet_group_name = "dev_rds_subnet_group"
#   subnet_groups        = tolist(module.networking.dev_public_subnets)
#   rds_mysql_sg_id      = module.security_group.rds_mysql_sg_id
#   mysql_db_identifier  = "mydb"
#   mysql_username       = "dbuser"
#   mysql_password       = "dbpassword"
#   mysql_dbname         = "devprojdb"
# }