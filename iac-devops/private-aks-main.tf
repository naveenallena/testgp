


# locals {
#   resource_group_name = var.Existing_resource_group_name
#   resource_group_location = var.Existing_resource_group_location
#  }
 

# # data "azurerm_key_vault" "tf_kv"{
# #   name= var.azurerm_key_vault_name
# #   resource_group_name = var.Existing_resource_group_name
# # }
# resource "azurerm_key_vault_access_policy" "aks" {
#   key_vault_id = data.azurerm_key_vault.tf_kv.id
#   tenant_id    = var.azurerm_key_vault_tenant_id
#   object_id    = var.azurerm_key_vault_object_id

#   key_permissions = ["Get"]
#   secret_permissions = ["Get"]
#   certificate_permissions = ["Get"]
# }

# #Existing subnet with address space "10.0.1.0/25

# data "azurerm_subnet" "base" {
#   name                = var.Existing_subnet_name
#   virtual_network_name = var.Existing_vnet_name
#   resource_group_name = var.Existing_subnet_resource_group_name
# }
# # Existing user assigned identity

# data "azurerm_user_assigned_identity" "base" {
#   name                = var.Existing_uai_name
#   resource_group_name = var.Existing_resource_group_name
# }



# resource "azurerm_kubernetes_cluster" "base" {
#   name                    = var.aks_cluster_name
#   location                = local.resource_group_location
#   resource_group_name     = local.resource_group_name
#   node_resource_group     = var.node_resource_group_name
#   sku_tier                = var.aks_sku_tier
#   kubernetes_version      = var.kubernetes_version
#   dns_prefix              = var.dns_prefix 
#   private_cluster_enabled = true

#   image_cleaner_enabled          = true
#   image_cleaner_interval_hours  = 168  

#   private_dns_zone_id     = var.private_dns_zone_id
#   tags                    = var.tags

# azure_active_directory_role_based_access_control {

# azure_rbac_enabled     = true
# managed                = true

# }

#   network_profile {
#     network_plugin = var.network_plugin
#     network_policy = var.network_policy
#     outbound_type  = var.outbound_type
#     service_cidr   = var.service_cidr
#     dns_service_ip = var.dns_service_ip
#     load_balancer_profile {
      
     
#       outbound_ip_address_ids  = var.outbound_ip_address_ids
      
#     }
#  }
    
#   default_node_pool {
#     name           = var.node_pool_name
#     vm_size        = var.vm_size
#     vnet_subnet_id = data.azurerm_subnet.base.id
#     zones          = var.nodepool_zones_availability
#     node_count     = var.node_count


#   }
#    auto_scaler_profile {
#   }
#   identity {
#     type = "UserAssigned"
#     identity_ids = [
#         "/subscriptions/9d9e15b7-b540-4fc0-b7fd-581b495962fc/resourceGroups/dev-cluster-k8s-use-RG/providers/Microsoft.ManagedIdentity/userAssignedIdentities/azurekeyvaultsecretsprovider-devtest-dev-k8s-use-aks"
#     ]
# }



# }
# Define your provider block for Azure
# provider "azurerm" {
#   features {}
# }



# Create a resource group
resource "azurerm_resource_group" "aks" {
  name     = var.resource_group_name
  location = var.location
}

# Create a virtual network with custom IP allocation
resource "azurerm_virtual_network" "aks" {
  name                = "my-vnet"
  address_space       = [var.vnet_cidr]
  location            = azurerm_resource_group.aks.location
  resource_group_name = azurerm_resource_group.aks.name
}

# Create a subnet for AKS
resource "azurerm_subnet" "aks" {
  name                 = "aks-subnet"
  resource_group_name  = azurerm_resource_group.aks.name
  virtual_network_name = azurerm_virtual_network.aks.name
  address_prefixes     = [var.aks_subnet_cidr]
}

# Create a private AKS cluster
resource "azurerm_kubernetes_cluster" "aks" {
  name                = var.aks_cluster_name
  location            = azurerm_resource_group.aks.location
  resource_group_name = azurerm_resource_group.aks.name
  dns_prefix          = var.aks_cluster_name
  private_cluster_enabled = true
  image_cleaner_enabled          = true
  image_cleaner_interval_hours  = 168

  default_node_pool {
    name       = "default"
    node_count = 3
    vm_size    = "Standard_DS2_v2"
    zones = [1,2,3]
  }
  
  # auto_scaler_profile {
  #     enabled        = true
  #     min_count      = 1
  #     max_count      = 3
  #     cpu_threshold  = 80
  #     memory_threshold  = 80
  #     cooldown       = 300
  # }
  network_profile {
    network_plugin = "azure"
    # network_policy = var.network_policy
    service_cidr   = "10.245.0.0/16"
    dns_service_ip = "10.245.0.10"
    # pod_cidr       = "10.244.0.0/16"
    

  }

  identity {
    type = "SystemAssigned"
  }
}

# data "azurerm_kubernetes_cluster" "credentials" {
#   name                = "devtest-k8s-PE-cluster"
#   resource_group_name = azurerm_resource_group.aks.name
# }
# provider "helm" {
#   kubernetes {
#     host                   = data.azurerm_kubernetes_cluster.credentials.kube_config.0.host
#     client_certificate     = base64decode(data.azurerm_kubernetes_cluster.credentials.kube_config.0.client_certificate)
#     client_key             = base64decode(data.azurerm_kubernetes_cluster.credentials.kube_config.0.client_key)
#     cluster_ca_certificate = base64decode(data.azurerm_kubernetes_cluster.credentials.kube_config.0.cluster_ca_certificate)

#   }
# }

# resource "helm_release" "nginx_ingress" {
#   name = "nginx-ingress-controller"
#   namespace = "default"
#   repository = "https://charts.bitnami.com/bitnami"
#   chart      = "nginx-ingress-controller"
#   # values = [
#   #   "${file("values.yaml")}"
  
#   set {
#     name  = "service.type"
#     value = "LoadBalancer"
#   }
  
# }
# # Install ingress helm chart using terraform
# # resource "helm_release" "ingress" {
# #   name       = "ingress"
# #   repository = "https://kubernetes.github.io/ingress-nginx"
# #   chart      = "ingress-nginx"
# #   version    = "4.5.2"
# #   namespace  = kubernetes_namespace.ingress.metadata.0.name
# #   depends_on = [
# #     kubernetes_namespace.ingress
# #   ]
# # }
# resource "kubernetes_horizontal_pod_autoscaler" "aks" {
#   metadata {
#     name = "aks-hpa"
#   }

#   spec {
#     min_replicas = 50
#     max_replicas = 100

#     scale_target_ref {
#       kind = "Deployment"
#       name = "MyApp"
#     }

#     behavior {
#       scale_down {
#         stabilization_window_seconds = 300
#         select_policy                = "Min"
#         policy {
#           period_seconds = 120
#           type           = "Pods"
#           value          = 1
#         }

#         policy {
#           period_seconds = 310
#           type           = "Percent"
#           value          = 100
#         }
#       }
#       scale_up {
#         stabilization_window_seconds = 600
#         select_policy                = "Max"
#         policy {
#           period_seconds = 180
#           type           = "Percent"
#           value          = 100
#         }
#         policy {
#           period_seconds = 600
#           type           = "Pods"
#           value          = 5
#         }
#       }
#     }
#   }
# }
