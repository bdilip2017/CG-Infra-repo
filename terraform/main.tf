# AKS Cluster with Monitoring and Autoscaling
resource "azurerm_kubernetes_cluster" "aks" {
  name                = "aksCluster"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  dns_prefix          = "aksCluster"

  default_node_pool {
    name       = "default"
    node_count = 2
    vm_size    = "Standard_DS2_v2"
    enable_auto_scaling = true
    min_count = 1
    max_count = 5
  }

  addon_profile {
    oms_agent {
      enabled                    = true
      log_analytics_workspace_id = azurerm_log_analytics_workspace.law.id
    }
  }

  identity {
    type = "SystemAssigned"
  }

  role_based_access_control {
    enabled = true
  }
}

# PostgreSQL Database
resource "azurerm_postgresql_server" "db" {
  name                = "postgresqlserver"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  sku_name            = "GP_Gen5_2"
  administrator_login = "adminuser"
  administrator_login_password = "securepassword123!"
}
