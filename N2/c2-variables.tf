# Input Variables
/*
# 1. Business Unit Name
variable "business_unit" {
  description = "Business Unit Name"
  type = string
  default = "hr"
}
# 2. Environment Name

# 3. Resource Group Name
variable "resoure_group_name" {
  description = "Resource Group Name"
  type = string
  default = "karan"
}
# 4. Resource Group Location
variable "resoure_group_location" {
  description = "Resource Group Location"
  type = string
  default = "East US2"s
}

# 5. Virtual Network Name
variable "virtual_network_name" {
  description = "Virtual Network Name"
  type = string 
  default = "karanvnet1"
}

variable "azurerm_subnet" {
  description = "Subnet"
  type = string
  default = "karansubnet-1"
  
}
*/

variable "environment" {
  description = "Environment Name"
  type = set(string)
  default = ["master","vm1","vm2","vm3"]
  #default = ["test"]
}

