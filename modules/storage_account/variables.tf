variable "name" {
  type = string
}

variable "location" {
  type = string
}

variable "resource_group_name" {
  type = string
}

variable "account_replication_type" {
  description = "Replication type, e.g., LRS or RAGRS"
  type        = string
}

variable "public_network_access_enabled" {
  type    = bool
  default = false
}

variable "env" {
  type = string
}