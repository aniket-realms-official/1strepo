output "Administrator_Password" {
  value = rsadecrypt(aws_instance.ec2_resource.password_data, file("./Ec2_connect.pem"))
}
