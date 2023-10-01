variable "resource_group_name" {
  description = "Name of the Azure resource group"
  default     = "devtest-k8s-PE-RG"
}

variable "aks_cluster_name" {
  description = "Name of the AKS cluster"
  default     = "devtest-k8s-PE3-cluster"
}

variable "dns_prefix" {
type = string
default = "aks"
}

variable "location" {
  description = "Azure region where the resources will be created"
  default     = "eastus"
}

variable "vnet_cidr" {
  description = "CIDR block for the virtual network"
  default     = "10.64.0.0/10"
}

variable "aks_subnet_cidr" {
  description = "CIDR block for the AKS subnet (maximum /20)"
  default     = "10.64.0.0/20"
}
