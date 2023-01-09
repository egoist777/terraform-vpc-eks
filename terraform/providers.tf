provider "aws" {
  region = "eu-central-1"
}

provider "kubernetes" {
  host                   = data.aws_eks_cluster.eks.endpoint
  token                  = data.aws_eks_cluster_auth.eks.token
  cluster_ca_certificate = data.aws_eks_cluster.eks.certificate_authority.0.data
}