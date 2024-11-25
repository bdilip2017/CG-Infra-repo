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
variable "tags" {
  description = "Tags for ACR"
  type        = map(string)
  default     = {}
}
