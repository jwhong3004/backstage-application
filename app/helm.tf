resource "helm_release" "nginx" {
  name       = var.ApplicationName
  chart      = "${path.module}/nginx"
  namespace  = "default"

  set {
    name  = "replicaCount"
    value = var.Replicas
  }
}
