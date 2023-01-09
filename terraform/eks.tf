module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "19.5.1"

  cluster_name    = local.eks_cluster
  cluster_version = "1.24"

  vpc_id     = module.vpc.vpc_id
  subnet_ids = module.vpc.private_subnets

  tags = local.tags

  # EKS Managed Node Group(s)

  eks_managed_node_groups = {
    one = {

      name         = "${var.worker_group_one_name}-${local.env}"
      min_size     = 1
      max_size     = 2
      desired_size = 2

      instance_types = [var.instance_type_one]
    }

    two = {

      name         = "${var.worker_group_two_name}-${local.env}"
      min_size     = 1
      max_size     = 2
      desired_size = 1

      instance_types = [var.instance_type_two]
    }
  }
}