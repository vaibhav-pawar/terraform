variable "ubuntu_ec2_ami_id" {
  description = "AMI id of the ubuntu instance"
  type        = string
}

variable "ec2_instance_type" {
  description = "instance type of the ubuntu instance"
  type        = string
}

variable "subnet_id" {
  description = "first subnet from public subnet"
  type        = string
}

variable "sg_for_jenkins" {
  description = "security group for the instance"
  type        = list(string)
}

variable "enable_public_ip_address" {
  description = "Enable public ip address"
  type        = string
}

variable "user_data_install_jenkins" {}