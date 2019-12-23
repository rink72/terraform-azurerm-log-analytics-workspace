provider "azurerm" {
  version = ">= 1.39.0"
}

locals {
    location = "australiasoutheast"
    rg_name = "testing-rg"
}

# Get a random integer to provide a unique Log Analytics workspace name as they are globally unique
resource "random_integer" "la_id" {
  min     = 10000
  max     = 50000
}

# Create a resource group to deploy the log analytics workspace to
module "resource-group" {
  source  = "rink72/resource-group/azurerm"
  version = "1.0.0"
  
  name = local.rg_name
  location = local.location
}

# Create the log analytics workspace. Use the outputs from the resource-group module to create an implicit dependancy
module "la_workspace" {
  source = "../../"

  name        = join("-", ["rink72latest", random_integer.la_id.result])
  resource_group_name = module.resource-group.name
  location = local.location

  la_depends_on = [
      module.resource-group
  ]
}