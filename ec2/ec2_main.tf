data "aws_availability_zones" "available" {}

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

  owners      = ["801119661308"]
}

resource "aws_instance" "ec2_instances_final" {
  count                  = 2
  ami                    = "${data.aws_ami.Windows.id}"
  instance_type          = var.instance_type
  #key_name               = "Ec2_connect"
  vpc_security_group_ids = ["${var.security_group}"]
  subnet_id              = "${element(var.subnets, count.index )}"
  user_data              = data.template_file.userdata_win.rendered
  get_password_data      = "true"
  tags = {
    Name = format("%s_%s", var.ec2_name, count.index+1)
    CreatedByTerraform = "true"
    Environment        = "dev"
  }
}

resource "aws_ebs_volume" "ebs_volume_final" {
  count             = 2
  availability_zone = "${data.aws_availability_zones.available.names[count.index]}"
  size              = 1
  type              = "gp2"
}

resource "aws_volume_attachment" "ebs_vol_attach_final" {
  count        = 2
  device_name  = "/dev/xvdh"
  instance_id  = "${aws_instance.ec2_instances_final.*.id[count.index]}"
  volume_id    = "${aws_ebs_volume.ebs_volume_final.*.id[count.index]}"
  force_detach = true
}

data "template_file" "userdata_win" {
template = <<EOF
<powershell>
msiexec.exe /i https://awscli.amazonaws.com/AWSCLIV2.msi
Initialize-AWSDefaultConfiguration -Accesskey AKIATC4BRTUBE2UAY6G3 -Secretkey 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 -Region us-east-2
Copy-S3Object -BucketName test-bucket-june-18-2021 -KeyPrefix Coreissue_Automation_Scripts -LocalFolder C:/
& "C:/master.ps1"
</powershell>
<persist>false</persist>
EOF
}
