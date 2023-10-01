# #### locals
# variable "resource_group_name" {
#   type    = string
#   #default = "my-resource-group"
# }

# variable "resource_group_location" {
#   type    = string
#   default = "eastus"
# }

# #### Existing
# variable "Existing_resource_group_name" {
#   type    = string
#   #default = "my-resource-group"
# }

# variable "Existing_resource_group_location" {
#   type    = string
#   default = "eastus"
# }

# ## Existing subnet for pods & Node ip's.
# variable "Existing_subnet_name" {
#   type    = string
# }

# variable "Existing_vnet_name" {
#   type    = string
# }

# variable "Existing_subnet_resource_group_name" {
#   type    = string
# }

# # Existing user assigned identity for both kubenet and control plane

# variable "Existing_uai_name" {
#   type    = string
# }

# ## AKS Cluster

# variable "aks_cluster_name" {
#   type  = string
# }

# variable "aks_sku_tier"{
# type = string
# }

# variable "kubernetes_version"{
# type = string
# }

# variable "dns_prefix" {
# type = string
# }

# variable "node_resource_group_name" {
# type    = string
# }


# variable "private_dns_zone_id" {
# type = string
# }

# ## AKS Network Profile

# variable "network_plugin"{
# type = string
# }

# variable "network_policy"{
# type = string
# }

# variable "outbound_type"{
# type = string
# }

# variable "service_cidr"{
# type = string
# }

# variable "dns_service_ip"{
# type = string
# }

# ## node pool

# variable "node_pool_name"{
# type = string
# }

# variable "vm_size"{
# type = string
# }

# variable "nodepool_zones_availability"{
# type = list
# }

# variable "node_count"{
# type = string
# }

# #loadbalancer 

# variable "outbound_ip_address_ids"{
# type = list
# }

# #key_valuterm_key_vault_name"{
# type = string
# }

# variable "azurerm_key_vault_tenant_id"{
# type = string
# }

# variable "azurerm_key_vault_object_id"{
# type = string
# }

# ### tags

# Define variables for customization
variable "resource_group_name" {
  description = "Name of the Azure resource group"
  default     = "devtest-k8s-PE-RG"
}

variable "aks_cluster_name" {
  description = "Name of the AKS cluster"
  default     = "devtest-k8s-PE-cluster"
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

variable "tags" {
  type = map(string)
  default = {}
  }