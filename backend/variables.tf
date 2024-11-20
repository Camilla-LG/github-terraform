variable "rg_backend_cmlg_name" {
  type        = string
  description = "Name of the resource group for the backend"
}

variable "rg_backend_cmlg_location" {
  type        = string
  description = "Location of the resource group for the backend"
}

variable "sa_backend_cmlg" {
  type        = string
  description = "Name of the storage account for the backend"
}

variable "sc_backend_cmlg" {
  type        = string
  description = "Name of the storage container for the backend"
  default     = ""
}

variable "kv_backend_cmlg_name" {
  type        = string
  description = "Name of the key vault for the backend"
}

variable "sa_backend_cmlg_accesskey_name" {
  type        = string
  description = "Name of the storage account access key for the backend"
}