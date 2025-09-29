variable "name" {
  type = string
}

variable "location" {
  type = string
}

variable "resource_group_name" {
  type = string
}

variable "public_network_access_enabled" {
  type    = bool
  default = false
}

variable "soft_delete_retention_days" {
  type    = number
  default = 7
}

variable "sku_name" {
  type    = string
  default = "standard"
}

variable "env" {
  type = string
}