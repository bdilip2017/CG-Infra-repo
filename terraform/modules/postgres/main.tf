resource "azurerm_postgresql_server" "postgres" {
  name                = var.db_name
  location            = var.location
  resource_group_name = var.resource_group_name
  sku_name            = "GP_Gen5_2"
  storage_mb          = 5120
  administrator_login          = var.db_user
  administrator_login_password = var.db_password
  version             = "11"
  tags                = var.tags

  threat_detection_policy {
    enabled                     = true
    email_account_admins        = true
    storage_account_access_key  = "<Your Storage Account Access Key>"
    storage_endpoint            = "<Your Storage Endpoint>"
  }
}

resource "azurerm_postgresql_database" "database" {
  name                = var.db_name
  resource_group_name = var.resource_group_name
  server_name         = azurerm_postgresql_server.postgres.name
}

resource "azurerm_postgresql_virtual_network_rule" "vnet_rule" {
  name                 = "postgres-vnet-rule"
  server_name          = azurerm_postgresql_server.postgres.name
  resource_group_name  = var.resource_group_name
  subnet_id            = var.vnet_subnet_id
}
