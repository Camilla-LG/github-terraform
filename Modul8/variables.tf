variable "rg_name" {
  type        = string
  description = "Name of the resource group"
  default = "rg-webcmlg"
}

variable "rg_location" {
  type        = string
  description = "Location of the resource group"
}

variable "sa_name" {
  type        = string
  description = "Name of the storage account"
  default = "sawebcmlg"
}

variable "index_document" {
  type        = string
  description = "Name of the index document"
  default = "index.html"
}