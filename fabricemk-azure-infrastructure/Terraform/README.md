# Shared Components provisioning with Terraform

Although I have multiple projects across different Azure Resources Groups and are isolated from each other. I also have a couple of shared components that I reuse across my infrastructure.

For example I have a shared App Service Plan, some Scheduled Jobs or a common storage for some DevOps operations etc...

To provision these components I use [HashiCorp Terraform](https://www.terraform.io/) and the [Azure Provider](https://www.terraform.io/docs/providers/azurerm/index.html).
