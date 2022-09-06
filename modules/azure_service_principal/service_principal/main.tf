terraform {
  experiments = [module_variable_optional_attrs]
}

# Create Azure AD App
data "azuread_users" "owners" {
  user_principal_names = var.service_principal.owners
}


resource "azuread_application" "main" {
  display_name = var.service_principal.name
  owners       = data.azuread_users.owners.object_ids
  lifecycle {
    ignore_changes = [
      required_resource_access
    ]
  }
}

# Create Service Principal associated with the Azure AD App
resource "azuread_service_principal" "main" {
  application_id = azuread_application.main.application_id
}

# Create Service Principal password
resource "azuread_service_principal_password" "main" {
  service_principal_id = azuread_service_principal.main.object_id
  end_date_relative    = coalesce(var.service_principal.duration, "17520h") # 2 years
}
