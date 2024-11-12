output "aks_contributor_role_assignment_id" {
  value = azurerm_role_assignment.aks_contributor.id
}

output "aks_reader_role_assignment_id" {
  value = azurerm_role_assignment.aks_reader.id
}
