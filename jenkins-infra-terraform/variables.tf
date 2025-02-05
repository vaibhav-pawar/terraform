variable "main_vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
}

variable "main_vpc_name" {
  description = "Name for the VPC"
  type        = string
}

variable "main_vpc_public_subnet_cidr" {
  description = "Public subnet of VPC"
  type        = list(string)
}

variable "main_vpc_private_subnet_cidr" {
  description = "Private subnet of VPC"
  type        = list(string)
}

variable "main_vpc_availability_zones" {
  description = "Availability Zones"
  type        = list(string)
}

variable "ubuntu_ec2_ami_id" {
  description = "AMI id of the ubuntu instance"
  type        = string
}

variable "ec2_instance_type" {
  description = "instance type of the ubuntu instance"
  type        = string
}