# VPC-webserver Creation Module#
module "vpc_webserver" {
  source             = "./VPC-Public"
  vpc_cidr_block     = "10.0.0.0/24"
  public_cidrs       = ["10.0.0.0/26", "10.0.0.64/26"]
  vpc_name           = "Webserver_VPC"
  public_subnet_name = "Webserver_Public_Subnet"
  sg_name            = "Webserver_sg"
  gateway_id         = module.IGW_webserver.ig_id
}

module "IGW_webserver" {
  source   = "./IGW"
  vpc_id   = module.vpc_webserver.vpc_id
  igw_name = "Webserver_IGW"
}

## Web Server Creation Module ##
module "web_server" {
  source         = "./ec2"
  ec2_count      = var.web_inst_count_tf
  ebs_count      = var.web_inst_count_tf
  instance_type  = var.web_inst_type_tf
  ec2_name       = "Webserver"
  ebs_vol_size   = var.web_ebs_size_tf
  security_group = module.vpc_webserver.security_group
  subnets        = module.vpc_webserver.public_subnets
}

## Bastion Host Creation ##
module "bastion_host" {
  source         = "./Bastion-host"
  b_host_count   = var.b_host_count_tf
  instance_type  = var.b_host_type_tf
  security_group = module.vpc_webserver.security_group
  subnets        = module.vpc_webserver.public_subnets
  b_host_name    = "JumpServer"
}

##  webserver loadbalancer Configuration ##
module "nlb" {
  source         = "./nlb"
  vpc_id         = module.vpc_webserver.vpc_id
  inst_id        = module.web_server.instance_id
  web_inst_count = var.web_inst_count_tf
  subnet1        = module.vpc_webserver.subnet1
  subnet2        = module.vpc_webserver.subnet2
}

# VPC-appserver Creation Module#
module "vpc_appserver" {
  source              = "./VPC-Private"
  vpc_cidr_block      = "10.1.0.0/24"
  private_cidrs       = ["10.1.0.128/26", "10.1.0.192/26"]
  vpc_name            = "Appserver_VPC"
  private_subnet_name = "Appserver_Private_Sunbet"
  sg_name             = "Appserver_sg"
}

## CoreAuth Server Creation Module ##
module "Auth_server" {
  source         = "./ec2"
  ec2_count      = var.Auth_inst_count_tf
  ebs_count      = var.Auth_inst_count_tf
  instance_type  = var.Auth_inst_type_tf
  ec2_name       = "Auth"
  ebs_vol_size   = var.Auth_ebs_size_tf
  security_group = module.vpc_appserver.security_group
  subnets        = module.vpc_appserver.private_subnets
}

## CoreIssue Server Creation Module ##
module "ISSU_server" {
  source         = "./ec2"
  ec2_count      = var.ISSU_inst_count_tf
  ebs_count      = var.ISSU_inst_count_tf
  instance_type  = var.ISSU_inst_type_tf
  ec2_name       = "ISSU"
  ebs_vol_size   = var.ISSU_ebs_size_tf
  security_group = module.vpc_appserver.security_group
  subnets        = module.vpc_appserver.private_subnets
}

## TNP Server Creation Module ##
module "TNP_server" {
  source         = "./ec2"
  ec2_count      = var.TNP_inst_count_tf
  ebs_count      = var.TNP_inst_count_tf
  instance_type  = var.TNP_inst_type_tf
  ec2_name       = "TNP"
  ebs_vol_size   = var.TNP_ebs_size_tf
  security_group = module.vpc_appserver.security_group
  subnets        = module.vpc_appserver.private_subnets
}

## SVCE Server Creation Module ##
module "SVCE_server" {
  source         = "./ec2"
  ec2_count      = var.SVCE_inst_count_tf
  ebs_count      = var.SVCE_inst_count_tf
  instance_type  = var.SVCE_inst_type_tf
  ec2_name       = "SVCE"
  ebs_vol_size   = var.SVCE_ebs_size_tf
  security_group = module.vpc_appserver.security_group
  subnets        = module.vpc_appserver.private_subnets
}

## WKF Server Creation Module ##
module "WKF_server" {
  source         = "./ec2"
  ec2_count      = var.WKF_inst_count_tf
  ebs_count      = var.WKF_inst_count_tf
  instance_type  = var.WKF_inst_type_tf
  ec2_name       = "WKF"
  ebs_vol_size   = var.WKF_ebs_size_tf
  security_group = module.vpc_appserver.security_group
  subnets        = module.vpc_appserver.private_subnets
}

## MC_Source Server Creation Module ##
module "SRC_server" {
  source         = "./ec2"
  ec2_count      = var.SRC_inst_count_tf
  ebs_count      = var.SRC_inst_count_tf
  instance_type  = var.SRC_inst_type_tf
  ec2_name       = "SRC"
  ebs_vol_size   = var.SRC_ebs_size_tf
  security_group = module.vpc_appserver.security_group
  subnets        = module.vpc_appserver.private_subnets
}

## MC_Sink Server Creation Module ##
module "SINK_server" {
  source         = "./ec2"
  ec2_count      = var.SINK_inst_count_tf
  ebs_count      = var.SINK_inst_count_tf
  instance_type  = var.SINK_inst_type_tf
  ec2_name       = "SINK"
  ebs_vol_size   = var.SINK_ebs_size_tf
  security_group = module.vpc_appserver.security_group
  subnets        = module.vpc_appserver.private_subnets
}

## File Processing Workflow Server Creation Module ##
module "BAT_server" {
  source         = "./ec2"
  ec2_count      = var.BAT_inst_count_tf
  ebs_count      = var.BAT_inst_count_tf
  instance_type  = var.BAT_inst_type_tf
  ec2_name       = "BAT"
  ebs_vol_size   = var.BAT_ebs_size_tf
  security_group = module.vpc_appserver.security_group
  subnets        = module.vpc_appserver.private_subnets
}

## WCF Server Creation Module ##
module "WCF_server" {
  source         = "./ec2"
  ec2_count      = var.WCF_inst_count_tf
  ebs_count      = var.WCF_inst_count_tf
  instance_type  = var.WCF_inst_type_tf
  ec2_name       = "WCF"
  ebs_vol_size   = var.WCF_ebs_size_tf
  security_group = module.vpc_appserver.security_group
  subnets        = module.vpc_appserver.private_subnets
}

## Report Server Creation Module ##
module "RPTS_server" {
  source         = "./ec2"
  ec2_count      = var.RPTS_inst_count_tf
  ebs_count      = var.RPTS_inst_count_tf
  instance_type  = var.RPTS_inst_type_tf
  ec2_name       = "RPTS"
  ebs_vol_size   = var.RPTS_ebs_size_tf
  security_group = module.vpc_appserver.security_group
  subnets        = module.vpc_appserver.private_subnets
}

## Report Delivery Server Creation Module ##
module "RPTD_server" {
  source         = "./ec2"
  ec2_count      = var.RPTD_inst_count_tf
  ebs_count      = var.RPTD_inst_count_tf
  instance_type  = var.RPTD_inst_type_tf
  ec2_name       = "RPTD"
  ebs_vol_size   = var.RPTD_ebs_size_tf
  security_group = module.vpc_appserver.security_group
  subnets        = module.vpc_appserver.private_subnets
}


## VPC-KMS Creation Module ##
module "vpc_kms" {
  source              = "./VPC-Private"
  vpc_cidr_block      = "10.2.0.0/24"
  private_cidrs       = ["10.2.0.128/26", "10.2.0.192/26"]
  vpc_name            = "KMS_VPC"
  private_subnet_name = "KMS_Private_Sunbet"
  sg_name             = "KMS_sg"
}

## KMS Server Creation Module ##
module "kms_server" {
  source         = "./ec2"
  ec2_count      = var.KMS_inst_count_tf
  ebs_count      = var.KMS_inst_count_tf
  instance_type  = var.KMS_inst_type_tf
  ec2_name       = "KMS"
  ebs_vol_size   = var.KMS_ebs_size_tf
  security_group = module.vpc_kms.security_group
  subnets        = module.vpc_kms.private_subnets
}


module "vpc_db" {
  source              = "./VPC-Private"
  vpc_cidr_block      = "10.3.0.0/24"
  private_cidrs       = ["10.3.0.128/26", "10.3.0.192/26"]
  vpc_name            = "DB_VPC"
  private_subnet_name = "DB_Private_Sunbet"
  sg_name             = "DB_sg"
}

## KMS Server Creation Module ##
module "db_server" {
  source         = "./ec2"
  ec2_count      = var.db_inst_count_tf
  ebs_count      = var.db_inst_count_tf
  instance_type  = var.db_inst_type_tf
  ec2_name       = "db"
  ebs_vol_size   = var.db_ebs_size_tf
  security_group = module.vpc_db.security_group
  subnets        = module.vpc_db.private_subnets
}

#VPC Peering vpc_webserver<->vpc_appserver
module "peer_vpc_webserver_appserver" {
  source           = "./VPC-Peering"
  peer_owner_id    = "212335697154"
  peer_vpc_id      = module.vpc_appserver.vpc_id
  local_vpc_id     = module.vpc_webserver.vpc_id
  peer_region      = var.region
  vpc_peering_name = "peering_vpc_webserver_appserver"
}

#VPC Peering vpc_appserver<->vpc_kms
module "peer_vpc_appserver_kms" {
  source           = "./VPC-Peering"
  peer_owner_id    = "212335697154"
  peer_vpc_id      = module.vpc_appserver.vpc_id
  local_vpc_id     = module.vpc_kms.vpc_id
  peer_region      = var.region
  vpc_peering_name = "peering_vpc_appserver_kms"
}

#VPC Peering vpc_appserver<->vpc_db
module "peer_vpc_appserver_db" {
  source           = "./VPC-Peering"
  peer_owner_id    = "212335697154"
  peer_vpc_id      = module.vpc_appserver.vpc_id
  local_vpc_id     = module.vpc_db.vpc_id
  peer_region      = var.region
  vpc_peering_name = "peering_vpc_appserver_db"
}

#VPC Peering vpc_kms<->vpc_db
module "peer_vpc_kms_db" {
  source           = "./VPC-Peering"
  peer_owner_id    = "212335697154"
  peer_vpc_id      = module.vpc_kms.vpc_id
  local_vpc_id     = module.vpc_db.vpc_id
  peer_region      = var.region
  vpc_peering_name = "peering_vpc_kms_db"
}
