
terraform {
  backend "azurerm" {
    resource_group_name  = "devtest-app-use-RG"
    storage_account_name = "applicationgwlog"
    container_name       = "terraformstate"
    key                  = "private-aks-test_3.tfstate"
  }
}

