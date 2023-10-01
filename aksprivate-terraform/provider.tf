terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "=3.7.0"
    }
  }
}


# provider "helm" {
 
#   version = "1.2.2"
#   kubernetes {
#     host = azurerm_kubernetes_cluster.aks.kube_config[0].host

#     client_key             = base64decode(azurerm_kubernetes_cluster.aks.kube_config[0].client_key)
#     client_certificate     = base64decode(azurerm_kubernetes_cluster.aks.kube_config[0].client_certificate)
#     cluster_ca_certificate = base64decode(azurerm_kubernetes_cluster.aks.kube_config[0].cluster_ca_certificate)
#     load_config_file       = false
#   }
# #  
  
# }



