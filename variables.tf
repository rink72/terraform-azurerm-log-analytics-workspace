variable "resource_group_name" {
    type = string
    description = "The name of the resource group to deploy the log analytics workspace in to."
}

variable "location" {
    type = string
    description = "The location to deploy the log analytics workspace in to."
}

variable "name" {
    type = string
    description = "The name of the log analytics workspace"
}

variable "sku" {
    type = string
    description = "The sku for the log analytics workspace."
    default = "PerGB2018"
}

variable "retention_in_days" {
    type = number
    description = "The retention period for data stored in the Log Analytics Workspace"
    default = 30
}

variable "solutions" {
    type = list(object({ solution_name = string, publisher = string, product = string }))
    description = "Solutions to install in to the log analytics workspace."
    default = []
}

variable "tags" {
    type = map(string)
    description = "Tags to apply to the log analytics workspace and solutions."
    default = {}
}
