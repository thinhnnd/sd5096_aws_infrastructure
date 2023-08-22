resource "aws_instance" "my_instance" {
  ami           = lookup(var.AMIS, var.AWS_REGION)
  instance_type = "t3.medium"

  # VPC subnet
  subnet_id = module.vpc.public_subnet_ids[0]

  # security group 
  vpc_security_group_ids = [aws_security_group.practical_devops_sg.id]

  #public SSH key name
  key_name = aws_key_pair.practical_devops_keypair.key_name

  user_data = file("./ec2_configs/install_docker_jenkin_userdata.sh")

  # Attach the EBS volume to the instance
  ebs_block_device {
    device_name = "/dev/sdf" # Change this to the appropriate device name
    volume_size = 10         # Size of the EBS volume
    volume_type = "gp2"      # You can choose the appropriate volume type
  }

  tags = {
    Name        = "Pratical DevOps EC2",
    Project     = "Practical DevOps"
    Environment = "TEST"
  }
}