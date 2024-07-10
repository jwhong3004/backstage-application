provider "aws" {
  region = var.awsRegion
}

module "eks_cicd" {
  source = "./app"

  eks_cluster_name = var.eks_cluster_name
  Replicas         = var.Replicas
  ApplicationName  = var.ApplicationName
}
