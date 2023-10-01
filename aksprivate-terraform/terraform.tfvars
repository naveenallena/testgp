# ## locals
# resource_group_name = "devtest-k8s-PE-RG"
# resource_group_location = "eastus"

# ## locals
# Existing_resource_group_name = "devtest-k8s-use-RG"
# Existing_resource_group_location = "eastus"

# ## Existing subnet for pods & Node ip's.

# Existing_subnet_name = "devtest-dev-k8s-use-SNET"
# Existing_vnet_name = "devtest-use-VNET"
# Existing_subnet_resource_group_name = "devtest-data-use-RG"

# # Existing user assigned identity for both kubenet and control plane

# Existing_uai_name="dev-k8s-use-MI"

# ### AKS Cluster
# aks_cluster_name= "devtest-dev-k8s-use-AKS-new"
# node_resource_group_name = "dev-cluster-k8s-use-RG-new"
# aks_sku_tier ="Standard"
# kubernetes_version = "1.25"
# dns_prefix = "dev"
# private_dns_zone_id = "/subscriptions/58d3b1f5-af8f-4621-b816-c003ef862587/resourceGroups/prod-dns-use-RG/providers/Microsoft.Network/privateDnsZones/privatelink.eastus.azmk8s.io"

# ## AKS Network Profile

# network_plugin = "azure"
# network_policy = "azure"
# outbound_type = "loadBalancer"
# service_cidr = "10.2.0.0/24"
# dns_service_ip = "10.2.0.19"

# #Node pool

# node_pool_name = "nodesk8s"
# vm_size = "Standard_D2_v2"
# nodepool_zones_availability = [1,2,3]
# node_count = 3

# #loadbalancer

# outbound_ip_address_ids = ["/subscriptions/9d9e15b7-b540-4fc0-b7fd-581b495962fc/resourceGroups/devtest-k8s-use-RG/providers/Microsoft.Network/publicIPAddresses/public-dev-k8s-outbound-use-PIP"]

# #key_vault

# azurerm_key_vault_name = "dt-msvc-use-VAULT"
# azurerm_key_vault_tenant_id = "11e55079-15ef-4cd4-b82c-e8739df53616"
# azurerm_key_vault_object_id = "a0f78891-7439-485d-8230-8f68ebc0855f"

# ## tags

# tags = {
#   "env"        = "dev"
#   "created_by" = "nallena"
#   "owner"      = "rginsberg"
  
# }
aks_cluster_name = "devtest-k8s-PE-cluster"