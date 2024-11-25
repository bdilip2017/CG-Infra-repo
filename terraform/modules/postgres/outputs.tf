output "db_host" {
  value = azurerm_postgresql_server.postgres.fqdn
}

output "db_user" {
  value = azurerm_postgresql_server.postgres.administrator_login
}

output "db_password" {
  value     = var.db_password
  sensitive = true
}

# Output Postgres Database Name
output "db_name" {
  description = "The database name of the PostgreSQL server"
  value       = azurerm_postgresql_database.db.name
}
