## VPC Creation ##
module "vpc" {
  source         = "./VPC-Main"
  vpc_cidr_block = "10.0.0.0/24"
  public_cidrs   = ["10.0.0.0/26", "10.0.0.64/26"]
  private_cidrs  = ["10.0.0.128/26", "10.0.0.192/26"]
}

#external webserver configuration
module "extweb_server" {
  source         = "./ec2"
  instance_type  = var.instance_type
  ebs_vol_size   = var.ebs_vol_size
  ec2_count      = var.ec2_count
  security_group = module.vpc.security_group
  subnets        = module.vpc.public_subnets
  ec2_name       = "external_webserver"
}

#external webserver load_balancer Configuration
module "alb" {
  source   = "./alb"
  vpc_id   = module.vpc.vpc_id
  inst1_id = module.extweb_server.instance1_id
  inst2_id = module.extweb_server.instance2_id
  subnet1  = module.vpc.subnet1
  subnet2  = module.vpc.subnet2
}

#external webserver autoscaling configuration
module "auto_scaling" {
  source           = "./autoscaling"
  vpc_id           = module.vpc.vpc_id
  subnet1          = module.vpc.subnet1
  subnet2          = module.vpc.subnet2
  target_group_arn = module.alb.alb_target_group_arn
  ec2_value_name   = "External_WebServer"
}

#internal webserver configuration
module "int_server" {
  source         = "./ec2"
  instance_type  = "t2.micro"
  security_group = module.vpc.security_group
  subnets        = module.vpc.public_subnets
  ec2_name       = "Internal_webserver"
}

#CoreIssue App Server configuration
module "coreissue_app_server" {
  source         = "./ec2"
  instance_type  = "t2.micro"
  security_group = module.vpc.security_group
  subnets        = module.vpc.private_subnets
  ec2_name       = "CoreIssue_App_webserver"
}

#CoreAuth Server configuration
module "coreauth_server" {
  source         = "./ec2"
  instance_type  = "t2.micro"
  security_group = module.vpc.security_group
  subnets        = module.vpc.private_subnets
  ec2_name       = "CoreAuth_server"
}

#KMS Server configuration
module "kms_server" {
  source         = "./ec2"
  instance_type  = "t2.micro"
  security_group = module.vpc.security_group
  subnets        = module.vpc.private_subnets
  ec2_name       = "KMS_server"
}

#TNP Server configuration
module "tnp_server" {
  source         = "./ec2"
  instance_type  = "t2.micro"
  security_group = module.vpc.security_group
  subnets        = module.vpc.private_subnets
  ec2_name       = "TNP_server"
}

#WCF Server configuration
module "wcf_server" {
  source         = "./ec2"
  instance_type  = "t2.micro"
  security_group = module.vpc.security_group
  subnets        = module.vpc.private_subnets
  ec2_name       = "WCF_server"
}

#Workflow Server configuration
module "workflow_server" {
  source         = "./ec2"
  instance_type  = "t2.micro"
  security_group = module.vpc.security_group
  subnets        = module.vpc.private_subnets
  ec2_name       = "Workflow_server"
}

#DB Server configuration
module "db_server" {
  source         = "./ec2"
  instance_type  = "t2.micro"
  security_group = module.vpc.security_group
  subnets        = module.vpc.private_subnets
  ec2_name       = "DB_server"
}
