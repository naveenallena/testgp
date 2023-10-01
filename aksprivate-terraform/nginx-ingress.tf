provider "helm" {
    kubernetes {
        your_cluster = var.aks_cluster_name
        host     = azurerm_kubernetes_cluster.your_cluster.kube_config.0.host
        client_key             = base64decode(azurerm_kubernetes_cluster.your_cluster.kube_config.0.client_key)
        client_certificate     = base64decode(azurerm_kubernetes_cluster.your_cluster.kube_config.0.client_certificate)
        cluster_ca_certificate = base64decode(azurerm_kubernetes_cluster.your_cluster.kube_config.0.cluster_ca_certificate)
    }  
}

data "helm_repository" "stable" {
  name = "stable"
  url  = "https://kubernetes-charts.storage.googleapis.com"
}

resource "helm_release" "nginix_ingress" {
    name      = "nginx_ingress"
    repository = data.helm_repository.stable.metadata.0.name
    chart     = "stable/nginx-ingress"
    namespace = "kube-system"
}