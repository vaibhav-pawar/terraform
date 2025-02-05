resource "aws_key_pair" "jenkins_ec2_instance_public_key" {
    key_name = "jenkins-key"
    public_key = file("/home/ubuntu/Jenkins-infra-terraform/jenkins-key.pub")
}

resource "aws_instance" "jenkins_instance" {
  ami           = var.ubuntu_ec2_ami_id
  instance_type = var.ec2_instance_type
  subnet_id     = var.subnet_id
  vpc_security_group_ids = var.sg_for_jenkins
  key_name = aws_key_pair.jenkins_ec2_instance_public_key.key_name
  associate_public_ip_address = var.enable_public_ip_address
  user_data = var.user_data_install_jenkins
  tags = {
    Name = "jenkins_instance"
  }
}
