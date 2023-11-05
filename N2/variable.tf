variable "location" {
  type    = string
}

variable "RG" {
  type     = string
}

variable "subscription_id" {
  type        = string
  description = "The Azure subscription id used to provision resources."
}

variable "nwprefix" {
  type    = map(string)
}
variable "Subnetid"{
type=string

}
variable "Subnet"{
type=string

}

/*
variable "vms" {
  type = map(object({
    size = string
    ServerType  = string
    source_image_id = string
    disks = map(object({
      size                 = number
      storage_account_type = string
      lun                  = number
    }))
  }))
}
*/