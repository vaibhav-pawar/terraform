output "main_vpc_id" {
  description = "id of the VPC"
  value = aws_vpc.main_vpc.id
}

output "main_vpc_public_subnet_id" {
  description = "id of the public subnets"
  value = aws_subnet.main_vpc_public_subnets.*.id
}

output "main_vpc_private_subnet_id" {
  description = "id of the private subnets"
  value = aws_subnet.main_vpc_private_subnets.*.id
}

output "main_vpc_internet_gateway" {
  description = "id of the igw attachced to VPC"
  value = aws_internet_gateway.main_vpc_internet_gateway.id
}

output "public_subnet_cidr_block" {
  description = "id of the public subnets"
  value = aws_subnet.main_vpc_public_subnets.*.cidr_block
}

output "private_subnet_cidr_block" {
  description = "id of the public subnets"
  value = aws_subnet.main_vpc_private_subnets.*.cidr_block
}

output "jenkins_instance_sg_id" {
  description = "id of the public subnets"
  value = aws_security_group.jenkins_instance_sg.id
}