# Introduction 
This project uses Terraform to provision resources for a .NET Core MVC 8 application in Azure. The resources include an Azure SQL Database, an Azure App Service, and an Azure Windows Web App with Hostname Binding.

# File Structure
The Terraform configuration is organized across several files:

- `variables.tf`: Defines all the variables used in the Terraform scripts.
- `web-app.tf`: Defines the Azure Service Plan and Windows Web App resources.
- `database.tf`: Defines the Azure SQL Database resource.
- `main.tf`: Sets up the Azure provider for Terraform and defines a resource group.
- `output.tf`: Defines the outputs that Terraform will return after applying the configuration.
- `pu-devtest.tfvars` and `kp-prod.tfvars`: Provide values for the variables for different environments (testing and production, respectively).

# Getting Started
1. Install Azure CLI: https://learn.microsoft.com/en-us/cli/azure/install-azure-cli-windows?tabs=azure-cli
2. Install Terraform: https://learn.hashicorp.com/tutorials/terraform/install-cli?in=terraform/azure-get-started

# Build and Test
1. Open a cmd prompt in the Terraform directory.
2. Run `az login` and select the relevant tenant. For KP devtest deployment, this will be: `Azure Dev/Test - IT (d7c6d0e7-252a-45db-833e-6d258cbeb96f)`
3. Run `terraform init` with the appropriate backend configuration. For KP devtest, the command would look like this:

terraform init -backend-config=storage_account_name=pusadevtestitterrastore -backend-config=container_name=kp-tfstate -backend-config=key=kp.devtest.kpwebsite.terraform.tfstate -backend-config=resource_group_name=pu-rg-devtest-san-terraform-state -backend-config=subscription_id=2b96ea8a-0bcf-4bc7-ad01-567dfa389001 -backend-config=tenant_id= <!-- Add tenant ID -->

4. Run `terraform plan -var-file=<vars>.tfvars -detailed-exitcode` to show the changes required by the current configuration.

# Main Terraform Commands
- `init`: Prepare your working directory for other commands.
- `validate`: Check whether the configuration is valid.
- `plan`: Show changes required by the current configuration.
- `apply`: Create or update infrastructure.
- `destroy`: Destroy previously-created infrastructure.

To specify a specific set of vars, add `-var-file="<vars>.tfvars"` to the command.

# Resources
This project creates the following resources:
- Azure SQL DB
- Azure App Service
- Azure Windows Web App with Hostname Binding

