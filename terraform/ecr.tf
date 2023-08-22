resource "aws_ecr_repository" "ecr_backend_repository" {
  name = "backend"
  tags = {
    Name        = "backend"
    Project     = "Pratical DevOps"
    Environment = "TEST"
  }
}

resource "aws_ecr_repository" "ecr_frontend_repository" {
  name = "frontend"
  tags = {
    Name        = "frontend"
    Project     = "Pratical DevOps"
    Environment = "TEST"
  }
}