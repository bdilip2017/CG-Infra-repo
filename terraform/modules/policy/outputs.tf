output "policy_definition_id" {
  value = azurerm_policy_definition.require_owner_tag.id
}

output "policy_assignment_id" {
  value = azurerm_policy_assignment.assign_owner_tag_policy.id
}
