variable "main_vpc_name" {
  description = "Name for the VPC"
  type        = string
}

variable "main_vpc_cidr" {
  description = "CIDR block for the VPC"
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