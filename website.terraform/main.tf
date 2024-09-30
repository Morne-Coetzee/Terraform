terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.3.0"
    }
  }
  backend "azurerm" {}
}

provider "azurerm" {
  features {}
}

data "azurerm_mssql_server" "refdata_sql_server" {
  name = "${var.refdata_sql_server_name}"
  resource_group_name = "${var.refdata_sql_server_resourcegroup_name}"
}

resource "azurerm_resource_group" "rg" {
  name = "${var.prefix}rg${var.postfix}"
  location = "${var.location}"
  tags = {
    Environment = "Terraformed"
    Owner = "Morne Coetzee"
    Tier = "${var.resource_tier_tag}"
    ResourceType = "King Price Website 1.5 App"
  }
}
