# Resource-1: Azure Resource Group
resource "azurerm_resource_group" "myrg" {
  name = "myrg-1"
  location = "East US"
}

resource "azurerm_storage_account" "mystor" {
  name = "terraformstate"
  resource_group_name = azurerm_resource_group.myrg.name
   location = azurerm_resource_group.myrg.location
   access_tier = "Standard"
   account_replication_type = "LRS"
}