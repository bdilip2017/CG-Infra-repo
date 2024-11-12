resource "azurerm_kubernetes_cluster" "aks" {
  name                = var.aks_name
  location            = var.location
  resource_group_name = var.resource_group_name
  dns_prefix          = var.aks_name

  default_node_pool {
    name               = "nodepool"
    vm_size            = "Standard_DS2_v2"
    enable_auto_scaling = true
    min_count          = 2
    max_count          = 5
    vnet_subnet_id     = var.vnet_subnet_id
  }

  identity {
    type = "SystemAssigned"
  }

  addon_profile {
    oms_agent {
      enabled = true
      log_analytics_workspace_id = var.log_analytics_workspace_id
    }
  }
}
