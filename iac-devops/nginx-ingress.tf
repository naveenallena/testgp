# resource "kubernetes_namespace" "ingress" {  
#   metadata {
#     name = "ingress"
#   }
# }
# Install ingress helm chart using terraform
# resource "helm_release" "ingress" {
#   name       = "ingress"
#   repository = "https://kubernetes.github.io/ingress-nginx"
#   chart      = "ingress-nginx"
#   version    = "4.5.2"
#   namespace  = kubernetes_namespace.ingress.metadata.0.name
#   depends_on = [
#     kubernetes_namespace.ingress
#   ]
# }

# resource "helm_release" "nginx_ingress" {
#   name = "nginx-ingress-controller"

#   repository = "https://charts.bitnami.com/bitnami"
#   chart      = "nginx-ingress-controller"

#   set {
#     name  = "service.type"
#     value = "ClusterIP"
#   }
# }