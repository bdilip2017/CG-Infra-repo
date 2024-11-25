variable "aks_name" {
  description = "AKS Cluster name"
  type        = string
}

variable "location" {
  description = "Azure region"
  type        = string
}

variable "resource_group_name" {
  description = "Resource group name"
  type        = string
}

variable "vnet_subnet_id" {
  description = "ID of the Virtual Network subnet for AKS"
  type        = string
}

variable "log_analytics_workspace_id" {
  description = "Log Analytics Workspace ID for monitoring"
  type        = string
}

variable "default_node_count" {
  description = "The desired number of nodes in the default node pool"
  type        = number
  default     = 2
}

variable "default_min_count" {
  description = "The minimum number of nodes in the default node pool"
  type        = number
  default     = 1
}

variable "default_max_count" {
  description = "The maximum number of nodes in the default node pool"
  type        = number
  default     = 5
}
variable "tags" {
  description = "Tags for ACR"
  type        = map(string)
  default     = {}
}
