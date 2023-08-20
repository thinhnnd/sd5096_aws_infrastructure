provider "aws" {
  access_key = var.AWS_ACCESS_KEY
  secret_key = var.AWS_SECRET_KEY
  region     = var.AWS_REGION
}

module "vpc" {
  source = "./vpc" # Path to the VPC module
}

module "eks_cluster" {
  source = "./eks" # Path to the EKS module
}