
variable "region" {
  default = "ap-south-1"
}

## KMS server variable ##
variable "KMS_inst_type_tf" {
  default = "t2.micro"
}
variable "KMS_inst_count_tf" {
  default = 2
}
variable "KMS_ebs_size_tf" {
  default = 10
}


## Web Server Variables ##
variable "web_inst_type_tf" {
  default = "t2.micro"
}
variable "web_inst_count_tf" {
  default = 2
}
variable "web_ebs_size_tf" {
  default = 10
}


## Auth Server Variables ##
variable "Auth_inst_type_tf" {
  default = "t2.micro"
}
variable "Auth_inst_count_tf" {
  default = 2
}
variable "Auth_ebs_size_tf" {
  default = 10
}


## ISSU Server Variables ##
variable "ISSU_inst_type_tf" {
  default = "t2.micro"
}
variable "ISSU_inst_count_tf" {
  default = 2
}
variable "ISSU_ebs_size_tf" {
  default = 10
}



## TNP Server Variables ##
variable "TNP_inst_type_tf" {
  default = "t2.micro"
}
variable "TNP_inst_count_tf" {
  default = 2
}
variable "TNP_ebs_size_tf" {
  default = 10
}


## SVCE Server Variables ##
variable "SVCE_inst_type_tf" {
  default = "t2.micro"
}
variable "SVCE_inst_count_tf" {
  default = 2
}
variable "SVCE_ebs_size_tf" {
  default = 10
}


## WKF Server Variables ##
variable "WKF_inst_type_tf" {
  default = "t2.micro"
}
variable "WKF_inst_count_tf" {
  default = 2
}
variable "WKF_ebs_size_tf" {
  default = 10
}


## MC_Source Server Variables ##
variable "SRC_inst_type_tf" {
  default = "t2.micro"
}
variable "SRC_inst_count_tf" {
  default = 2
}
variable "SRC_ebs_size_tf" {
  default = 10
}


## MC_Sink Server Variables ##
variable "SINK_inst_type_tf" {
  default = "t2.micro"
}
variable "SINK_inst_count_tf" {
  default = 2
}
variable "SINK_ebs_size_tf" {
  default = 10
}


## File Processing Workflow Server Variables ##
variable "BAT_inst_type_tf" {
  default = "t2.micro"
}
variable "BAT_inst_count_tf" {
  default = 2
}
variable "BAT_ebs_size_tf" {
  default = 10
}


## WCF Server Variables ##
variable "WCF_inst_type_tf" {
  default = "t2.micro"
}
variable "WCF_inst_count_tf" {
  default = 2
}
variable "WCF_ebs_size_tf" {
  default = 10
}



## Report Server Variables ##
variable "RPTS_inst_type_tf" {
  default = "t2.micro"
}
variable "RPTS_inst_count_tf" {
  default = 2
}
variable "RPTS_ebs_size_tf" {
  default = 10
}


## Report Delivery Server Variables ##
variable "RPTD_inst_type_tf" {
  default = "t2.micro"
}
variable "RPTD_inst_count_tf" {
  default = 2
}
variable "RPTD_ebs_size_tf" {
  default = 10
}


## DB Server Variables ##
variable "db_inst_type_tf" {
  default = "t2.micro"
}
variable "db_inst_count_tf" {
  default = 2
}
variable "db_ebs_size_tf" {
  default = 100
}

## Bastion Host ##
variable "b_host_count_tf" {
  default = 2
}

variable "b_host_type_tf" {
  default = "t2.micro"
}
