output "acr_login_server" {
  description = "The login server of the Azure Container Registry"
  value       = azurerm_container_registry.acr.login_server
}

output "acr_pull_secret_name" {
  description = "The name of the Kubernetes pull secret created for ACR"
  value       = kubernetes_secret.acr_pull_secret.metadata[0].name
}
