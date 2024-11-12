# Role assignment for Contributor group
resource "azurerm_role_assignment" "aks_contributor" {
  scope                = var.resource_id
  role_definition_name = "Contributor"
  principal_id         = var.contributor_group_id
}

# Role assignment for Reader group
resource "azurerm_role_assignment" "aks_reader" {
  scope                = var.resource_id
  role_definition_name = "Reader"
  principal_id         = var.reader_group_id
}
