resource "azurerm_kubernetes_cluster" "aks" {
  name                = var.aks_name
  location            = var.location
  resource_group_name = var.resource_group_name
  tags                = var.tags

  default_node_pool {
    name       = "default"
    vm_size    = "Standard_DS2_v2"
    enable_auto_scaling = true
    node_count = var.default_node_count
    min_count  = var.default_min_count
    max_count  = var.default_max_count
    vnet_subnet_id = var.subnet_id
  }

  identity {
    type = "SystemAssigned"
  }

  addon_profile {
    oms_agent {
      enabled                    = true
      log_analytics_workspace_id = var.log_analytics_workspace_id
    }
  }

  role_based_access_control {
    enabled = true
  }

  network_profile {
    network_plugin     = "azure"                     # Advanced networking using Azure CNI
    dns_service_ip     = "10.0.0.10"                 # Internal DNS service IP
    service_cidr       = "10.0.0.0/16"               # CIDR for Kubernetes services
    pod_cidr           = "10.244.0.0/16"             # CIDR for Kubernetes pods
    outbound_type      = "loadBalancer"              # External traffic routing
  }
}
