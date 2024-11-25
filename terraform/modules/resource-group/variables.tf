variable "resource_group_name" {
  description = "The name of the Azure Resource Group"
  type        = string
}

variable "location" {
  description = "The Azure region for the Resource Group"
  type        = string
}

variable "tags" {
  description = "Tags for ACR"
  type        = map(string)
  default     = {}
}