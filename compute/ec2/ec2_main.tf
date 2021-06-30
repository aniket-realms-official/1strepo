resource "aws_instance" "ec2_resource" {
  ami                    = var.ec2_ami
  instance_type          = var.ec2_instance_type
  //count                  = var.ec2_count
  key_name           = "Ec2_connect"
  vpc_security_group_ids = var.sg_id
  subnet_id              = var.subnet_id
  tags = {
    Name = var.ec2_name
    CreatedByTerraform = "true"
    Environment        = "dev"
  }
  user_data = data.template_file.userdata_win.rendered
  get_password_data = "true"
}

  resource "aws_ebs_volume" "ec2_ebs_volume" {
    count             = "${var.ec2_count * var.ec2_ebs_volume_count}"
    availability_zone = "${element(aws_instance.ec2_resource.*.availability_zone, count.index)}"
    size              = var.volume_size
  }

  resource "aws_volume_attachment" "ebs_att" {
    count = "${var.ec2_count * var.ec2_ebs_volume_count}"
    device_name = "xvdb"
    volume_id   = "${aws_ebs_volume.ec2_ebs_volume.*.id[count.index]}"
    instance_id = "${element(aws_instance.ec2_resource.*.id, count.index)}"
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
