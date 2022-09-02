provider "azurerm" {
  features {}
}

resource "azurerm_role_definition" "container-etl-permissions" {
  for_each          = { for role in var.azure_roles : role.name => role }
  assignable_scopes = [each.value.scope]
  name              = each.value.name
  scope             = each.value.scope
  permissions {
    actions = each.value.permissions
  }
}
