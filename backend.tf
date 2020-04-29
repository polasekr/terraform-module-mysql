terraform {
  backend "azurerm" {
    resource_group_name  = "rgTerraformStateEastus"
    storage_account_name = "stjudecloudtfstates"
    container_name       = "core-eastus"
    key                  = "operator/mysql-terraform.tfstate"
  }
}
