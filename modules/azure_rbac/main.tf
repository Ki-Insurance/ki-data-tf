provider "azurerm" {
  features {}
}

resource "azurerm_role_assignment" "assignments" {
  for_each             = { for rbac in var.azure_rbac : "${rbac.role}-${rbac.scope}-${rbac.service_principal}" => rbac }
  scope                = each.value.scope
  role_definition_name = each.value.role
  principal_id         = var.azure_service_principals[each.value.service_principal]["object_id"]
}
