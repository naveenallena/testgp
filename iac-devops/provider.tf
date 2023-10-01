provider "azurerm" {
  features {
    resource_group {
      prevent_deletion_if_contains_resources = false
    }
  }
}


terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 2.0"
    #  azuread = {
    #   version = ">= 2.26.0" // https://github.com/terraform-providers/terraform-provider-azuread/releases
     
    }
#      kubernetes = {
#       source  = "hashicorp/kubernetes"
#       version = ">= 2.0.3"
      
#     }
#     helm = {
#       source  = "hashicorp/helm"
#       version = ">= 2.1.0"
      
#     }
#      kubectl = {
#       source  = "gavinbunney/kubectl"
#       version = ">= 1.7.0"
      
#     }
    }
  }
# # data "azurerm_kubernetes_cluster" "aks" {
# #   # depends_on          = [module.aks-cluster] # refresh cluster state before reading
# #   name                = var.aks_cluster_name
# #   resource_group_name = var.resource_group_name
# # }



# # Your resource configurations go here.

# #   required_providers {
# #     # azurerm = {
# #     #   source  = "hashicorp/azurerm"
# #     #   version = "~>2.0"
      
# #     }

    
  
  


# # provider "kubernetes" {
# #  # host                   = azurerm_kubernetes_cluster.aks.kube_admin_config.0.host
# #   #client_certificate     = base64decode(azurerm_kubernetes_cluster.aks.kube_admin_config.0.client_certificate)
# #  # client_key             = base64decode(azurerm_kubernetes_cluster.aks.kube_admin_config.0.client_key)
# #  # cluster_ca_certificate = base64decode(azurerm_kubernetes_cluster.aks.kube_admin_config.0.cluster_ca_certificate)
# #   #load_config_file       = false
# # }
# # provider "helm" {
# #   debug = true
# #   kubernetes {
# #     #host                   = azurerm_kubernetes_cluster.aks.kube_admin_config.0.host
# #    # client_certificate     = base64decode(azurerm_kubernetes_cluster.aks.kube_admin_config.0.client_certificate)
# #     #client_key             = base64decode(azurerm_kubernetes_cluster.aks.kube_admin_config.0.client_key)
# #     #cluster_ca_certificate = base64decode(azurerm_kubernetes_cluster.aks.kube_admin_config.0.cluster_ca_certificate)
# #   }
# # }
# # provider "kubectl" {
# #   #host                   = azurerm_kubernetes_cluster.aks.kube_admin_config.0.host
# #   #client_certificate     = base64decode(azurerm_kubernetes_cluster.aks.kube_admin_config.0.client_certificate)
# #   #client_key             = base64decode(azurerm_kubernetes_cluster.aks.kube_admin_config.0.client_key)
# #   #cluster_ca_certificate = base64decode(azurerm_kubernetes_cluster.aks.kube_admin_config.0.cluster_ca_certificate)
# #   load_config_file       = false




