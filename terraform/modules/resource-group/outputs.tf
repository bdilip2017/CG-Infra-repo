output "resource_group_name" {
  description = "The name of the created Resource Group"
  value       = azurerm_resource_group.rg.name
}

output "resource_group_id" {
  description = "The ID of the created Resource Group"
  value       = azurerm_resource_group.rg.id
}

output "location" {
  description = "The location of the created Resource Group"
  value       = azurerm_resource_group.rg.location
}
