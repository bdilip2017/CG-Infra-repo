resource "azurerm_container_registry" "acr" {
  name                = var.acr_name
  resource_group_name = var.resource_group_name
  location            = var.location
  sku                 = "Basic"
  admin_enabled       = true
  tags                = var.tags
}

# Assign AcrPull role to the AKS managed identity
resource "azurerm_role_assignment" "acr_pull" {
  principal_id         = var.aks_kubelet_identity
  role_definition_name = "AcrPull"
  scope                = azurerm_container_registry.acr.id
}

# Use the Kubernetes provider to create the pull secret
provider "kubernetes" {
  host                   = var.kube_config.host
  client_certificate     = base64decode(var.kube_config.client_certificate)
  client_key             = base64decode(var.kube_config.client_key)
  cluster_ca_certificate = base64decode(var.kube_config.cluster_ca_certificate)
}

resource "kubernetes_secret" "acr_pull_secret" {
  metadata {
    name      = "acr-secret"
    namespace = var.kubernetes_namespace
  }

  type = "kubernetes.io/dockerconfigjson"

  data = {
    ".dockerconfigjson" = jsonencode({
      auths = {
        "${azurerm_container_registry.acr.login_server}" = {
          username = azurerm_container_registry.acr.admin_username
          password = azurerm_container_registry.acr.admin_password
        }
      }
    })
  }
}
