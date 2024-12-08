locals {
  workspaces_suffix = terraform.workspace == "default" ? "" : "${terraform.workspace}"

  rg_name = terraform.workspace == "default" ? "${var.rg_name}" : "${var.rg_name}-${local.workspaces_suffix}"
  sa_name = terraform.workspace == "default" ? "${var.sa_name}" : "${var.sa_name}${local.workspaces_suffix}"
  web_suffix = "<h1>${terraform.workspace}</h1>"
}

resource "random_string" "random_string" {
  length  = 10
  special = false
  upper   = false
}

resource "azurerm_resource_group" "rg" {
  name     = local.rg_name
  location = var.rg_location
}

output "rg_name" {
  value = azurerm_resource_group.rg.name
}

resource "azurerm_storage_account" "sa" {
  name                     = "${lower(local.sa_name)}${random_string.random_string.result}"
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "GRS"

  static_website {
    index_document = var.index_document
  }
}

resource "azurerm_storage_blob" "index_html" {
  name                   = var.index_document
  storage_account_name   = azurerm_storage_account.sa.name
  storage_container_name = "$web"
  type                   = "Block"
  content_type           = "text/html"
  source_content         = <<EOT
  <html>
    <body>
      <h1>Web page created with Terraform: ${local.workspaces_suffix}</h1>
    </body>
  </html>
  EOT
}


output "primary_web_endpoint" {
  value = azurerm_storage_account.sa.primary_web_endpoint
}


#Destroy - test of Github Actions destroy option via commit message
#attempt nr 532529