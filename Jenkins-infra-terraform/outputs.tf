output "main_vpc_id" {
  value = module.network.main_vpc_id
}

output "main_vpc_public_subnet_id" {
  value = module.network.main_vpc_public_subnet_id
}

output "main_vpc_private_subnet_id" {
  value = module.network.main_vpc_private_subnet_id
}

output "main_vpc_internet_gateway" {
  value = module.network.main_vpc_internet_gateway
}

output "public_subnet_cidr_block" {
  value = module.network.public_subnet_cidr_block
}

output "private_subnet_cidr_block" {
  value = module.network.private_subnet_cidr_block
}

output "jenkins_instance_sg_id" {
  value = module.network.jenkins_instance_sg_id
}
