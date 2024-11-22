module "resource_group" {
  source              = "./modules/resource-group"
  resource_group_name = "app-resource-group"
  location            = "East US"
  tags                = var.tags
}

module "network" {
  source              = "./modules/network"
  location            = module.resource_group.location
  resource_group_name = module.resource_group.resource_group_name
  vnet_name           = var.vnet_name
  tags                = var.tags
}

module "aks" {
  source              = "./modules/aks"
  aks_name            = var.aks_name
  resource_group_name = module.resource_group.resource_group_name
  location            = module.resource_group.location
  vnet_subnet_id           = module.network.subnet_id
  log_analytics_workspace_id        = module.log_analytics.workspace_id
  default_node_count  = 2
  default_min_count   = 1
  default_max_count   = 5
  tags                = var.tags
}

module "acr" {
  source              = "./modules/acr"
  acr_name            = "app-acr"
  resource_group_name = module.resource_group.resource_group_name
  location            = module.resource_group.location
  aks_kubelet_identity = module.aks.kubelet_identity
  kube_config         = module.aks.kube_config
  kubernetes_namespace = "default"
  tags                = var.tags
}

module "postgres" {
  source              = "./modules/postgres"
  resource_group_name = var.resource_group_name
  location            = module.resource_group.location
  db_name             = var.db_name
  db_user             = var.db_user
  db_password         = var.db_password
  vnet_subnet_id      = module.network.subnet_id
  log_analytics_workspace_id = module.log_analytics.workspace_id
  tags                = var.tags
}

module "log_analytics" {
  source              = "./modules/log_analytics"
  resource_group_name = var.resource_group_name
  location            = module.resource_group.location
  tags                = var.tags
}

module "rbac" {
  source              = "./modules/rbac"
  resource_id         = module.aks.aks_id  # Pass the AKS cluster ID as the scope for RBAC
  contributor_group_id = var.contributor_user_id
  reader_group_id      = var.reader_user_id
}

# Example of calling the policy module to assign policies in a specific resource group

module "policy" {
  source = "./modules/policy"
  
  # Specify the scope for the policy assignment (e.g., resource group ID)
  scope = azurerm_resource_group.example.id  # Adjust to your resource group resource
}
