variable "location" {
  description = "Name from 'az account list-locations -otable'"
  default = ""
}
variable "prefix" {
  description ="Resources are constructed by {var.prefix} + 'customvalue' + {var.postfix}"
  default = ""
}
variable "postfix" {
  description ="Resources are constructed by {var.prefix} + 'customvalue' + {var.postfix}"
  default = ""
}
variable "resource_tier_tag" {
  default = "Development"
}

variable "refdata_sql_server_resourcegroup_name" {
  description = "Name of the resource group SQL Server instance the DB will be created in, ask OPS"
  default = ""
}
variable "refdata_sql_server_name" {
  description = "Name of the SQL Server instance the DB will be created in, ask OPS"
  default = ""
}
variable "sql_administrator_login"{
  default = ""
}
variable "sql_administrator_login_password" {
  default = ""
}

variable "database_sku" {
  description = "SKU for the database"
  default = "Basic"  
}
variable "database_max_size_gb" {
  description = "Size in GB for the database"
  default = "2"  
}

variable "asp_sku" {
  description = "SKU for the App Service Plan"
  default = "F1"
}
variable "asp_os_type" {
  description = "Operating System Type for the App Service Plan"
  default = "Windows"
}
variable "asp_environment_name" {
  description = "Environment name for the App Service Plan"
  default = "Development"
}
variable "asp_new_relic_app_name" {
  description = "Application name used by New Relic Agent"
  default = ""
}
variable "asp_new_relic_license_key" {
  description = "License key used by New Relic Agent"
  default = ""
}
variable "asp_vnet_subnet_id" {
  description = "Virtual network subnet connected to the App Service Plan"
  default = null
}
variable "asp_vnet_route_all_enabled" {
  description = "Private traffic and service endpoint traffic is always routed through the virtual network"
  default = false
}

variable "customdomain_name" {
  default = ""
}
variable "link_customdomain" {
  default = false
}
variable "customdomain_ssl_state" {
  description = "When ssl_state is set you must also set the thumbprint"
  default = ""
}
variable "customdomain_thumbprint" {
  description = "Get the thumbprint using PS, for example: Get-AzWebAppCertificate -ResourceGroupName kp-rg-prod-san-sa-kpwebsite-tf | ForEach { $_.Thumbprint }"
  default = ""
}