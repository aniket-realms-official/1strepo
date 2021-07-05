variable "region" {
  description = "Use AWS region"
  type        = string
}
variable "ssh_public_key_file" {
  # Generate via 'ssh-keygen -f openvpn -t rsa'
  description = "The public SSH key to store in the EC2 instance"
  default     = "settings/pem-key"
}
