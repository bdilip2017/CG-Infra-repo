variable "aks_id" {
  description = "The ID of the AKS cluster"
  type        = string
}

variable "contributor_user_id" {
  description = "Azure Active Directory user ID or Service Principal ID for Contributor role"
  type        = string
}

variable "reader_user_id" {
  description = "Azure Active Directory user ID or Service Principal ID for Reader role"
  type        = string
}
