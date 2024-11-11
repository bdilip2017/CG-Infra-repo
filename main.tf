provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg" {
  name     = "app-resource-group"
  location = "East US"
}

# AKS Cluster
resource "azurerm_kubernetes_cluster" "aks" {
  name                = "app-aks"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  default_node_pool {
    name       = "nodepool"
    node_count = 2
    vm_size    = "Standard_DS2_v2"
  }
}

# PostgreSQL
resource "azurerm_postgresql_server" "postgres" {
  name                = "app-postgres"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  sku_name            = "GP_Gen5_2"
}
