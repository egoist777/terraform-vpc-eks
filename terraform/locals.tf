locals {
  eks_cluster = "${var.eks_cluster_name}-${local.env}"
  env = terraform.workspace
  tags = {
    Automation = "terraform"
    Environment = local.env
  }
}