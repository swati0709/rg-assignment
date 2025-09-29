variable "location_kv" {
  description = "Region for Key Vault"
  type        = string
  default     = "canadaeast"
}

variable "location_sa_lrs" {
  description = "Region for LRS Storage Account"
  type        = string
  default     = "canadacentral"
}

variable "location_sa_ragrs" {
  description = "Region for RA-GRS Storage Account"
  type        = string
  default     = "canadaeast"
}

variable "env" {
  description = "Environment name (dev, qa, stg, prd)"
  type        = string

  validation {
    condition     = contains(["dev", "qa", "stg", "prd"], var.env)
    error_message = "Invalid env value. Must be one of: dev, qa, stg, prd."
  }
}

variable "project_prefix" {
  description = "Prefix for naming resources"
  type        = string
}
