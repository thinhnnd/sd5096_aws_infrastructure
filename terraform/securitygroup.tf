resource "aws_security_group" "practical_devops_sg" {
  vpc_id      = module.vpc.id
  name        = "PracticalDevOps SG"
  description = "Allow SSH, HTTP and 8080 for Jenkin"
  tags = {
    Name        = "PracticalDevOps SG"
    Project     = "Practical DevOps"
    Environment = "test"
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["0.0.0.0/0"]
  }
}