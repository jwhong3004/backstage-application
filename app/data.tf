data "aws_caller_identity" "current" {}

data "aws_region" "current" {}

data "aws_eks_cluster" "eks" {
  name = var.eks_cluster_name
}

data "aws_eks_cluster_auth" "eks" {
  name = var.eks_cluster_name
}

provider "helm" {
  kubernetes {
    host                   = data.aws_eks_cluster.eks.endpoint
    token                  = data.aws_eks_cluster_auth.eks.token
    cluster_ca_certificate = base64decode(data.aws_eks_cluster.eks.certificate_authority.0.data)
  }
}

provider "kubernetes" {
  host                   = data.aws_eks_cluster.eks.endpoint
  token                  = data.aws_eks_cluster_auth.eks.token
  cluster_ca_certificate = base64decode(data.aws_eks_cluster.eks.certificate_authority.0.data)
}

