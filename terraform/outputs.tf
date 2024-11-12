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
