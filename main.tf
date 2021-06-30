provider "aws" {
  profile = "default"
  region  = "${var.region}"
  region = var.region
}
#####################################################
#               Step1 : VPC Creation                #
#####################################################
module "vpc" {
  source = "./networking/vpc" #Project path: networking\vpc
}

#####################################################
#             Step2.1 : Private Subnet Creation     #
#####################################################
module "private_subnet" {
  source = "./networking/subnet/private" #Project path: networking\subnet\private
  vpc_id = module.vpc.vpc_id
  pri_sub_availability_zone = var.private_az
}

#####################################################
# Step2.2 : Public External Subnet Creation         #
#####################################################
module "public_subnet" {
  source = "./networking/subnet/public" #Project path: networking\subnet\public
  vpc_id = module.vpc.vpc_id
  pub_az = var.public_az
}

# #######################################################
# Step3: Create a public facing internet gateway for    #
#        connect VPC/Network to the internet world and  #
#        attach this gateway to VPC                     #
# #######################################################
module "internet_gateway" {
  source = "./networking/internet-gateway" #Project path: networking\internet-gateway
  vpc_id = module.vpc.vpc_id
}

# #########################################################
# Step4: Create a routing table for Internet gateway,     #
#        so that instance can connect to outside world,   #
#        update and associate it with public subnet.      #
# #########################################################
module "route_table" {
  source                    = "./networking/routetable" #Project path: networking\routetable
  vpc_id                    = module.vpc.vpc_id
  ig_id                     = module.internet_gateway.ig_id
  private_subnet_id         = module.private_subnet.private_subnet_id
  subnet_public_id          = module.public_subnet.subnet_public_id
  //subnet_public_internal_id = module.public_subnet.subnet_public_internal_id
}

######################################################################
# Step5: Security Group is essentially just a (virtual) firewall,    #
#        meant for the instance we create inorder to control the     #
#        ingress and egress traffic                                  #
######################################################################
module "security_group" {
  source = "./security/securitygroup" #Project path: security\securitygroup
  vpc_id = module.vpc.vpc_id
}

# ####################################
# #    Step6: Launch public and private ec2 instance #
# ####################################
# module "ec2" {
#   source    = "./compute/ec2"
#   #ec2_key_pair = aws_key_pair.generated_key.myec2keypair
#   sg_id_01 = ["${module.security_group.sg_01_id}"]
#   // ["${aws_security_group.sg_01.id}"]
#   sg_id_02 = ["${module.security_group.sg_02_id}"]
#   subnet_public_id = module.public_subnet.subnet_public_id
#   subnet_private_id = module.private_subnet.private_subnet_id
#   #Project path: compute/ec2  # subnet_public_external_id = module.public_subnet.subnet_public_external_id
# }

######################################
#     External Server module      #
######################################

module "external_webserver" {
  #source = "./compute/external_webserver"   -- commented as testing
  source = "./compute/ec2"
  sg_id = ["${module.security_group.sg_01_id}"]
  subnet_id = module.public_subnet.subnet_public_id
  ec2_name = "external_webserver_01"
  }

  #####################################
    #  Internal Server module      #
  #####################################

  module "internal_webserver" {
    source = "./compute/ec2"
    sg_id = ["${module.security_group.sg_01_id}"]
    subnet_id = module.public_subnet.subnet_public_id
    ec2_name = "internal_webserver_01"
    }

    ######################################
    #     App Server module      #
    ######################################

  module "app_server" {
    source = "./compute/ec2"
    sg_id = ["${module.security_group.sg_02_id}"]
    subnet_id = module.private_subnet.private_subnet_id
    ec2_name = "app_server"
    }


    ######################################
    #     CoreAuth Server module      #
    ######################################

    module "coreauth_server" {
    source = "./compute/ec2"
    sg_id = ["${module.security_group.sg_02_id}"]
    subnet_id = module.private_subnet.private_subnet_id
    ec2_name = "coreauth_server"
    }

    ######################################
    #     KMS Server module      #
    ######################################

    module "kms_server" {
    source = "./compute/ec2"
    sg_id = ["${module.security_group.sg_02_id}"]
    subnet_id = module.private_subnet.private_subnet_id
    ec2_name = "kms_server"
    }

    ######################################
    #     TNP Server module      #
    ######################################

    module "tnp_server" {
    source = "./compute/ec2"
    sg_id = ["${module.security_group.sg_02_id}"]
    subnet_id = module.private_subnet.private_subnet_id
    ec2_name = "tnp_server"
    }

    ######################################
    #     WCF Server module      #
    ######################################

    module "wcf_server" {
    source = "./compute/ec2"
    sg_id = ["${module.security_group.sg_02_id}"]
    subnet_id = module.private_subnet.private_subnet_id
    ec2_name = "wcf_server"
    }

    ######################################
    #     WorkFlow Server module      #
    ######################################

    module "workflow_server" {
    source = "./compute/ec2"
    sg_id = ["${module.security_group.sg_02_id}"]
    subnet_id = module.private_subnet.private_subnet_id
    ec2_name = "workflow_server"
    }


    ######################################
    #     DB Server module      #
    ######################################

    module "db_server" {
    source = "./compute/ec2"
    sg_id = ["${module.security_group.sg_02_id}"]
    subnet_id = module.private_subnet.private_subnet_id
    ec2_name = "db_server"
    }


# resource "tls_private_key" "myec2keypair" {
#  algorithm = "RSA"
# }
# resource "aws_key_pair" "generated_key" {
#  key_name = "myec2keypair"
#  public_key = "${tls_private_key.myec2keypair.public_key_openssh}"
#  depends_on = [
#   tls_private_key.myec2keypair
#  ]
# }
# resource "local_file" "key" {
#  content = "${tls_private_key.myec2keypair.private_key_pem}"
#  filename = "myec2keypair.pem"
#  file_permission ="0400"
#  depends_on = [
#   tls_private_key.myec2keypair
#  ]
#  }
