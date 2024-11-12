module "network" {
  source              = "./modules/network"
  location            = var.location
  resource_group_name = var.resource_group_name
  vnet_name           = var.vnet_name
}

module "aks" {
  source              = "./modules/aks"
  resource_group_name = var.resource_group_name
  location            = var.location
  vnet_subnet_id      = module.network.subnet_id
  aks_name            = var.aks_name
  log_analytics_workspace_id = module.log_analytics.workspace_id
}

module "postgres" {
  source              = "./modules/postgres"
  resource_group_name = var.resource_group_name
  location            = var.location
  db_name             = var.db_name
  db_user             = var.db_user
  db_password         = var.db_password
  vnet_subnet_id      = module.network.subnet_id
  log_analytics_workspace_id = module.log_analytics.workspace_id
}

module "log_analytics" {
  source              = "./modules/log_analytics"
  resource_group_name = var.resource_group_name
  location            = var.location
}

module "rbac" {
  source              = "./modules/rbac"
  resource_id         = module.aks.aks_id  # Pass the AKS cluster ID as the scope for RBAC
  contributor_group_id = var.contributor_group_id
  reader_group_id      = var.reader_group_id
}