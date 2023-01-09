module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "3.18.1"

  name = "${var.vpc_name}-${local.env}"
  cidr = var.cidr
  azs  = data.aws_availability_zones.azs.names
  public_subnets = [
    cidrsubnet(var.cidr, 8, 1),
    cidrsubnet(var.cidr, 8, 2),
    cidrsubnet(var.cidr, 8, 3)
  ]

  private_subnets = [
    cidrsubnet(var.cidr, 8, 11),
    cidrsubnet(var.cidr, 8, 12),
    cidrsubnet(var.cidr, 8, 13)
  ]

  enable_nat_gateway   = true
  single_nat_gateway   = true
  enable_dns_hostnames = true

  tags = {
    "kubernetes.io/cluster/${local.eks_cluster}" = "shared"
  }

  private_subnet_tags = {
    "kubernetes.io/cluster/${local.eks_cluster}" = "shared"
    "kubernetes.io/role/internal-elb"               = "1"
  }

  public_subnet_tags = {
    "kubernetes.io/cluster/${local.eks_cluster}" = "shared"
    "kubernetes.io/role/elb"                        = "1"
  }
}