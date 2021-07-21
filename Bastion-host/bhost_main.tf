## Data - Availaibility Zone Section ##
data "aws_availability_zones" "available" {}

## Data - AMI Section ##
data "aws_ami" "Windows" {
  most_recent = true

  filter {
    name   = "name"
    values = ["Windows_Server-2019-English-Full-Base-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["801119661308"]
}


## Bastion Host Creation ##
resource "aws_instance" "bastion_host" {
  count                  = var.b_host_count
  ami                    = data.aws_ami.Windows.id
  instance_type          = var.instance_type
  key_name               = "ec2_login_key"
  vpc_security_group_ids = ["${var.security_group}"]
  subnet_id              = element(var.subnets, count.index)
  user_data              = data.template_file.userdata_win.rendered
  get_password_data      = "true"
  tags = {
    Name               = format("%s_%s", var.b_host_name, count.index + 1)
    CreatedByTerraform = "true"
    Environment        = "dev"
  }
}

## User-Data Section ##
data "template_file" "userdata_win" {
  template = <<EOF
<powershell>
msiexec.exe /i https://awscli.amazonaws.com/AWSCLIV2.msi
</powershell>
<persist>false</persist>
EOF
}
