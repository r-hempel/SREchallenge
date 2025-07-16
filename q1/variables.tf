# Global variables
variable "location" {
    type = string  
}

# AZ resourceGroup variables
variable "resourceGroupName" {
    type = string
}
variable "resourceGroupTag" {
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
variable "storageAccountTag" {
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