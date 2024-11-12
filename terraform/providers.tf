provider "azurerm" {
  features {}
}

terraform {
  required_version = ">= 0.12.24"
  backend "azurerm" {

    storage_account_name = "piogbldevsta001lrs"
    access_key           = "__piogbldevsta001lrs-key1__"
    container_name       = "tfstate"
    key                  = "__rgtfstate__"
  }
}