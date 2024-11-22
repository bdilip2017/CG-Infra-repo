output "aks_name" {
  value = azurerm_kubernetes_cluster.aks.name
}

output "kube_config" {
  description = "Kubeconfig for the AKS cluster"
  value = azurerm_kubernetes_cluster.aks.kube_config_raw
}

output "aks_id" {
  value = azurerm_kubernetes_cluster.aks.id
  description = "The resource ID of the AKS cluster"
}

output "kubelet_identity" {
  description = "The managed identity of the AKS kubelet"
  value = azurerm_kubernetes_cluster.aks.identity[0].principal_id
}