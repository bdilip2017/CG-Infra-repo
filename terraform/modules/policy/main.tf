# Define the policy that requires an 'Owner' tag on all resources
resource "azurerm_policy_definition" "require_owner_tag" {
  name         = "require-owner-tag"
  policy_type  = "Custom"
  mode         = "Indexed"
  display_name = "Require 'Owner' Tag on Resources"
  description  = "Ensures that all resources have an 'Owner' tag for accountability."

  metadata = <<METADATA
    {
      "category": "Tags"
    }
METADATA

  parameters = <<PARAMETERS
    {
      "tagName": {
        "type": "String",
        "metadata": {
          "displayName": "Tag Name",
          "description": "Name of the tag, e.g., 'Owner'"
        },
        "defaultValue": "Owner"
      }
    }
PARAMETERS

  policy_rule = <<POLICY_RULE
    {
      "if": {
        "field": "[concat('tags[', parameters('tagName'), ']')]",
        "equals": "null"
      },
      "then": {
        "effect": "deny"
      }
    }
POLICY_RULE
}

# Assign the policy to a specific scope (e.g., a resource group)
resource "azurerm_policy_assignment" "assign_owner_tag_policy" {
  name                 = "enforce-owner-tag"
  policy_definition_id = azurerm_policy_definition.require_owner_tag.id
  scope                = var.scope
  description          = "Assignment of the 'Require Owner Tag' policy to enforce tagging"
}
