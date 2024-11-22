# dev.tfvars
location = "East US"
resource_group_name = "my-rg-dev"
vnet_name = "my-vnet-dev"
aks_name = "my-aks-dev"
db_name = "mydb-dev"
db_user = "adminuser"
db_password = "securePassword123"
contributor_user_id = "<Object ID of AKS_Contributor_Group_Dev>"
reader_user_id            = "<Object ID of AKS_Reader_Group_Dev>"
tags = {
  Environment = "Dev"
}

