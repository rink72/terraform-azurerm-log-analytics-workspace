# terraform-azurerm-log-analytics-workspace
Terraform module to create a log analytics workspace

![Terraform Version](https://img.shields.io/badge/Terraform-0.12.6-green.svg)

Examples:
```hcl
module "log-analytics" {
  source  = "rink72/log-analytics-workspace/azurerm"
  version = "1.0.0"
  
  name = "rink72-la"
  location = "uswest2"
  resource_group_name = "logging"
  tags = {
      "testTag" = "testValue"
  }
}
```

```hcl
module "log-analytics" {
  source  = "rink72/log-analytics-workspace/azurerm"
  version = "1.0.0"
  
  name = "rink72-la"
  location = "uswest2"
  resource_group_name = "logging"

  solutions = [
      {
          name = "AutomationAccount",
          publisher = "Microsoft",
          product = "OMSGallery/AutomationAccount"
      }
  ]

  tags = {
      "testTag" = "testValue"
  }
}
```
