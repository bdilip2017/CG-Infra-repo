output "aks_cluster_name" {
  value = module.aks.aks_name
}

output "postgres_hostname" {
  value = module.postgres.db_host
}

output "postgres_username" {
  value = module.postgres.db_user
}

output "postgres_password" {
  value = module.postgres.db_password
}

output "postgres_dbname" {
  value = module.postgres.db_name
}

output "aks_contributor_role_assignment" {
  value = module.rbac.aks_contributor_role_assignment
}

output "aks_reader_role_assignment" {
  value = module.rbac.aks_reader_role_assignment
}

output "acr_login_server" {
  value = module.acr.acr_login_server
}

output "acr_pull_secret_name" {
  value = module.acr.acr_pull_secret_name
}

output "aks_kube_config" {
  value = module.aks.kube_config
}

output "resource_group_name" {
  value = module.resource_group.resource_group_name
}

output "resource_group_id" {
  value = module.resource_group.resource_group_id
}

output "location" {
  value = module.resource_group.location
}


