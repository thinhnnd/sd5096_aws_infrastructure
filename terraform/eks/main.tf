module "vpc" {
  source = "../vpc" # Path to the VPC module
}

module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "18.14.0"
  # insert the 15 required variables here

  cluster_name                    = "eks-cluster"
  cluster_version                 = "1.26"
  cluster_endpoint_private_access = true
  cluster_endpoint_public_access  = true
  vpc_id                          = module.vpc.id
  subnet_ids                      = module.vpc.public_subnet_ids

  eks_managed_node_group_defaults = {
    disk_size = 50
  }

  node_security_group_additional_rules = {
    egress_self_all = {
      description = "Node to any hop all ports/protocols"
      protocol    = "-1"
      from_port   = 0
      to_port     = 0
      type        = "egress"
      cidr_blocks = ["0.0.0.0/0"] # Allow all outbound traffic
    }
  }

  eks_managed_node_groups = {
    spot = {
      desired_size = 1
      min_size     = 1
      max_size     = 1

      labels = {
        role = "spot"
      }

      instance_types = ["t3.medium"]
      capacity_type  = "SPOT"
    }
  }

  tags = {
    Name        = "Practical DevOps EKS cluster"
    Project     = "Practical DevOps"
    Environment = "TEST"
  }
}