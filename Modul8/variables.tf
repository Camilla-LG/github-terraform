variable "rg_name" {
  type        = string
  description = "Name of the resource group"
  default = "rg-webcmlg"
}

variable "rg_location" {
  type        = string
  description = "Location of the resource group"
  default = "sawebcmlg"
}

variable "sa_name" {
  type        = string
  description = "Name of the storage account"
}

variable "index_document" {
  type        = string
  description = "Name of the index document"
  default = "index.html"
}