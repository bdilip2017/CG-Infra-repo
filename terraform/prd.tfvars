# prod.tfvars
location = "East US"
resource_group_name = "my-rg-prod"
vnet_name = "my-vnet-prod"
aks_name = "my-aks-prod"
db_name = "mydb-prod"
db_user = "adminuser"
db_password = "securePassword456"
contributor_user_id = "<Object ID of AKS_Contributor_Group_Prod>"
reader_user_id            = "<Object ID of AKS_Reader_Group_Prod>"
tags = {
  Environment = "Production"
}
