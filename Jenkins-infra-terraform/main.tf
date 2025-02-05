# Call the Network Module
module "network" {
  source             = "./modules/network"
  main_vpc_cidr      = var.main_vpc_cidr
  main_vpc_name      = var.main_vpc_name
  main_vpc_public_subnet_cidr = var.main_vpc_public_subnet_cidr
  main_vpc_private_subnet_cidr = var.main_vpc_private_subnet_cidr
  main_vpc_availability_zones = var.main_vpc_availability_zones
}

# Call the Compute Module
module "jenkins_ec2_instance" {
    source = "./modules/compute"
    ubuntu_ec2_ami_id = var.ubuntu_ec2_ami_id
    ec2_instance_type = var.ec2_instance_type
    subnet_id = element(module.network.main_vpc_public_subnet_id, 0)
    sg_for_jenkins = [module.network.jenkins_instance_sg_id]
    enable_public_ip_address = true
    user_data_install_jenkins = templatefile("./modules/compute/scripts/jenkins-installer.sh", {})
}