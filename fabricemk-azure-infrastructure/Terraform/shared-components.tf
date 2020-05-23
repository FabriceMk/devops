# Configure the Azure Provider
provider "azurerm" {
  # Whilst version is optional, we /strongly recommend/ using it to pin the version of the Provider being used
  version = "=1.36.0"
}

# Configure an existing Azure Storage account to be used as Terraform backend and save the state of the infrastructure
terraform {
  backend "azurerm" {
    resource_group_name  = "shared-components-rg"
    storage_account_name = "fabricemkshared"
    container_name       = "terraform"
    key                  = "shared-components.terraform.tfstate"
  }
}

# Create an App Service Plan that will be shared across web applications
resource "azurerm_app_service_plan" "fabricemk-sp" {
  name  = "fabricemk-sp"
  location = "${var.region}"
  resource_group_name = "${var.resource-group}"
  kind = "Linux"
  reserved = true

  sku {
    tier = "Basic"
    size = "B1"
  }
}