# Global variables
variable "location" {
    type = string  
}

# AZ resourceGroup variables
variable "resourceGroupName" {
    type = string
}
variable "resourceGroupTagKey" {
    type = string
}
variable "resourceGroupTagValue" {
    type = string
}

# AZ storageAccount variables
variable "storageAccountName" {
    type = string
}
variable "storageAccountResourceGroup" {
    type = string
}
variable "storageAccountSKU" {
    type = string
    default = "standard_LRS"
}
variable "storageAccountAccessTier" {
    type = string
    default = "Hot"
}
variable "storageAccountTagKey" {
    type = string
}
variable "storageAccountTagValue" {
    type = string
}

# AZ storageAccountCointainer variables
variable "storageAccountCointainerName" {
    type = string
    default = "sre"
}
variable "storageAccountCointainerType" {
    type = string
    default = "private"
}