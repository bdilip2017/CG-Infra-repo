output "aks_name" {
  value = azurerm_kubernetes_cluster.aks.name
}

output "kube_config" {
  value = azurerm_kubernetes_cluster.aks.kube_config_raw
}

output "aks_id" {
  value = azurerm_kubernetes_cluster.aks.id
  description = "The resource ID of the AKS cluster"
}
