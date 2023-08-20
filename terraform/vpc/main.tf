module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "main_vpc"
  cidr = "10.0.0.0/16"

  azs             = ["${var.AWS_REGION}a", "${var.AWS_REGION}b"]
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24"]
  public_subnets  = ["10.0.4.0/24", "10.0.5.0/24"]

  map_public_ip_on_launch = true
  enable_nat_gateway      = true
  enable_vpn_gateway      = true
  single_nat_gateway      = true
  one_nat_gateway_per_az  = false

  tags = {
    Terraform   = "true"
    Project     = "Practical DevOps"
    Environment = "TEST"
  }
}