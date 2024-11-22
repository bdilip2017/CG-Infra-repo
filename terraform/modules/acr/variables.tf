variable "acr_name" {
  description = "The name of the Azure Container Registry"
  type        = string
}

variable "resource_group_name" {
  description = "The resource group for the ACR"
  type        = string
}

variable "location" {
  description = "The Azure region for the ACR"
  type        = string
}

variable "aks_kubelet_identity" {
  description = "The managed identity of the AKS kubelet for ACR access"
  type        = string
}

variable "kube_config" {
  description = "Kubeconfig for the Kubernetes provider"
  type        = object({
    host                   = string
    client_certificate     = string
    client_key             = string
    cluster_ca_certificate = string
  })
}

variable "kubernetes_namespace" {
  description = "The Kubernetes namespace where the pull secret will be created"
  type        = string
  default     = "default"
}

variable "tags" {
  description = "Tags for ACR"
  type        = map(string)
  default     = {}
}
