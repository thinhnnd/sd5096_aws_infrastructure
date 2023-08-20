module "vpc" {
  source = "../vpc" # Path to the VPC module
}

module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "18.14.0"
  # insert the 15 required variables here

  cluster_name                    = "eks-cluster"
  cluster_version                 = "1.23"
  cluster_endpoint_private_access = true
  cluster_endpoint_public_access  = true
  vpc_id                          = module.vpc.id
  subnet_ids                      = module.vpc.public_subnet_ids

  eks_managed_node_group_defaults = {
    disk_size = 50
  }

  eks_managed_node_groups = {
    general = {
      desired_size = 1
      min_size     = 1
      max_size     = 10

      labels = {
        role = "general"
      }

      instance_types = ["t2.micro"]
      capacity_type  = "ON_DEMAND"
    }

    spot = {
      desired_size = 1
      min_size     = 1
      max_size     = 10

      labels = {
        role = "spot"
      }

      taints = [{
        key    = "market"
        value  = "spot"
        effect = "NO_SCHEDULE"
      }]

      instance_types = ["t2.micro"]
      capacity_type  = "SPOT"
    }
  }

  tags = {
    Name        = "Practical DevOps EKS cluster"
    Project     = "Practical DevOps"
    Environment = "TEST"
  }
}