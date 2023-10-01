provider "azurerm" {
  features {}

}
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
  # image_cleaner_enabled          = true
  # image_cleaner_interval_hours  = 168
    tags = {
    Environment = "Dev"
    Created_by  = "nallena"
    Owner     = "rginsberg"
  }
  default_node_pool {
    name       = "default"
    node_count = 3
    vm_size    = "Standard_DS2_v2"
    zones = [1,2,3]
  }
  

  network_profile {
    network_plugin = "azure"
    # network_policy = var.network_policy
    service_cidr   = "10.64.0.0/20"
    dns_service_ip = "10.64.1.1"
    # pod_cidr       = "10.244.0.0/16"
    

  }

  identity {
    type = "SystemAssigned"
  }
}


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
