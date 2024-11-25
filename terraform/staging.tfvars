# stag.tfvars
location = "East US"
resource_group_name = "my-rg-stg"
vnet_name = "my-vnet-stg"
aks_name = "my-aks-stg"
db_name = "mydb-stg"
db_user = "adminuser"
db_password = "securePassword789"
contributor_user_id = "<Object ID of AKS_Contributor_Group_stg>"
reader_user_id            = "<Object ID of AKS_Reader_Group_stg>"
tags = {
  Environment = "UAT"
}