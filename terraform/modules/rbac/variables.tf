variable "resource_id" {
  description = "The ID of the resource to assign roles to (e.g., AKS cluster ID)"
  type        = string
}

variable "contributor_group_id" {
  description = "Object ID of the AAD group with Contributor access"
  type        = string
}

variable "reader_group_id" {
  description = "Object ID of the AAD group with Reader access"
  type        = string
}
