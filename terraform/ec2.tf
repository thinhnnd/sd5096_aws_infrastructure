resource "aws_instance" "my_instance" {
  ami           = lookup(var.AMIS, var.AWS_REGION)
  instance_type = "t2.micro"

  # VPC subnet
  subnet_id = module.vpc.public_subnet_ids[0]

  # security group 
  vpc_security_group_ids = [aws_security_group.practical_devops_sg.id]

  #public SSH key name
  key_name = aws_key_pair.practical_devops_keypair.key_name

  user_data = file("./ec2_configs/install_docker_jenkin_userdata.sh")

  tags = {
    Name        = "Pratical DevOps EC2",
    Project     = "Practical DevOps"
    Environment = "TEST"
  }
}