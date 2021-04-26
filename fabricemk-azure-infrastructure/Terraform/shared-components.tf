# Configure the Azure Provider
provider "azurerm" {
  features {}
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
  name                = "fabricemk-sp"
  location            = var.region
  resource_group_name = var.resource-group
  kind                = "Linux"
  reserved            = true

  sku {
    tier = "Basic"
    size = "B1"
  }

  tags = {
    Product = "Shared"
  }
}

