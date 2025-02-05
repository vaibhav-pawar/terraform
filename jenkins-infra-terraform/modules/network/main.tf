# Create a new VPC
resource "aws_vpc" "main_vpc" {
  cidr_block           = var.main_vpc_cidr
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags = {
    Name = var.main_vpc_name
  }
}

# Setup public subnet
resource "aws_subnet" "main_vpc_public_subnets" {
    count = length(var.main_vpc_public_subnet_cidr)
    vpc_id = aws_vpc.main_vpc.id
    cidr_block = element(var.main_vpc_public_subnet_cidr, count.index)
    availability_zone = element(var.main_vpc_availability_zones, count.index)
    map_public_ip_on_launch = true
    tags = {
        Name = "main_vpc_public_subnet-${count.index + 1}"
    }
}

# Setup private subnet
resource "aws_subnet" "main_vpc_private_subnets" {
    count = length(var.main_vpc_private_subnet_cidr)
    vpc_id = aws_vpc.main_vpc.id
    cidr_block = element(var.main_vpc_private_subnet_cidr, count.index)
    availability_zone = element(var.main_vpc_availability_zones, count.index)
    tags = {
        Name = "main_vpc_private_subnet-${count.index + 1}"
    }
}

# Setup Internet Gatway
resource "aws_internet_gateway" "main_vpc_internet_gateway" {
    vpc_id = aws_vpc.main_vpc.id
    tags = {
        Name = "main_vpc_internet_gateway"
    }
}

# Public route table
resource "aws_route_table" "main_vpc_public_route_table" {
    vpc_id = aws_vpc.main_vpc.id
    route {
        cidr_block = "0.0.0.0/0"   #internet
        gateway_id = aws_internet_gateway.main_vpc_internet_gateway.id
    }
    tags = {
        Name = "main_vpc_public_route_table"
    }
}

# Private route table
resource "aws_route_table" "main_vpc_private_route_table" {
    vpc_id = aws_vpc.main_vpc.id
    tags = {
        Name = "main_vpc_private_route_table"
    }
}

# Public Route Table and Public Subnet Association
resource "aws_route_table_association" "main_vpc_public_rt_subnet_association" {
    count = length(aws_subnet.main_vpc_public_subnets)
    subnet_id = aws_subnet.main_vpc_public_subnets[count.index].id
    route_table_id = aws_route_table.main_vpc_public_route_table.id
}

# Private Route Table and Private Subnet Association
resource "aws_route_table_association" "main_vpc_private_rt_subnet_association" {
    count = length(aws_subnet.main_vpc_private_subnets)
    subnet_id = aws_subnet.main_vpc_private_subnets[count.index].id
    route_table_id = aws_route_table.main_vpc_private_route_table.id
}

# Security group
resource "aws_security_group" "jenkins_instance_sg" {
    name = "jenkins_instance_sg"
    description = "Security group for Jenkins EC2 instance"
    vpc_id = aws_vpc.main_vpc.id

    # ssh access to jenkins instance
    ingress {
        description = "Allow remote SSH from anywhere"
        cidr_blocks = ["0.0.0.0/0"]
        from_port = 22
        to_port = 22
        protocol = "tcp"
    }

    # enable http
    ingress {
        description = "Allow HTTP request from anywhere"
        cidr_blocks = ["0.0.0.0/0"]
        from_port = 80
        to_port = 80
        protocol = "tcp"
    }

    # enable jenkins port
    ingress {
        description = "Allow 8080 port to access jenkins"
        cidr_blocks = ["0.0.0.0/0"]
        from_port = 8080
        to_port = 8080
        protocol = "tcp"
    }

    egress {
        description = "Allow outgoing request"
        cidr_blocks = ["0.0.0.0/0"]
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
    }

    tags = {
        Name = "jenkins_instance_sg"
    }
}