# Assign Contributor Role
resource "azurerm_role_assignment" "aks_contributor" {
  principal_id         = var.contributor_user_id
  role_definition_name = "Contributor"
  scope                = var.aks_id
}

# Assign Reader Role
resource "azurerm_role_assignment" "aks_reader" {
  principal_id         = var.reader_user_id
  role_definition_name = "Reader"
  scope                = var.aks_id
}

