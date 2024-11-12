output "db_host" {
  value = azurerm_postgresql_server.postgres.fully_qualified_domain_name
}

output "db_user" {
  value = azurerm_postgresql_server.postgres.administrator_login
}

output "db_password" {
  value     = var.db_password
  sensitive = true
}
