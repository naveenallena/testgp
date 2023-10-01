terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.40.0"
    }
  }
}

provider "azurerm" {
  features {}
}



resource "azurerm_kubernetes_cluster" "aks" {
  name                         = var.aks_cluster_name
  location                     = var.location
  resource_group_name          = "devtest-k8s-PE-RG"
  dns_prefix                   = var.dns_prefix
  private_cluster_enabled      = true
  image_cleaner_enabled        = true
  image_cleaner_interval_hours = 168


  

  tags = {
    Environment = "Dev"
    Created_by  = "nallena"
    Owner       = "rginsberg"
  }
  identity {
    type = "SystemAssigned"
  }

 default_node_pool {
    name       = "default"
    enable_auto_scaling = true
    max_count = 3
    min_count = 1
    vm_size    = "Standard_DS2_v2"
    zones = [1,2,3]
  }
  network_profile {
    network_plugin = "azure"
    service_cidr   = "10.64.0.0/20"
    dns_service_ip = "10.64.2.1"
    docker_bridge_cidr = "10.64.0.0/20"
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

}