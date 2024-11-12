variable "location" {
  description = "Azure region"
  type        = string
}

variable "resource_group_name" {
  description = "Resource group name"
  type        = string
}

variable "vnet_name" {
  description = "Virtual Network name"
  type        = string
}

variable "aks_name" {
  description = "AKS Cluster name"
  type        = string
}

variable "db_name" {
  description = "PostgreSQL database name"
  type        = string
}

variable "db_user" {
  description = "PostgreSQL admin username"
  type        = string
}

variable "db_password" {
  description = "PostgreSQL admin password"
  type        = string
  sensitive   = true
}

variable "contributor_group_id" {
  description = "Object ID for the Contributor AAD group"
  type        = string
}

variable "reader_group_id" {
  description = "Object ID for the Reader AAD group"
  type        = string
}
