resource "aws_ecr_repository" "ecr_repository" {
  name = "practical-devops-erc"
  tags = {
    Name        = "practical-devops-erc"
    Project     = "Pratical DevOps"
    Environment = "TEST"
  }
}