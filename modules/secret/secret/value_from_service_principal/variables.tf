variable "secret_id" {
  type = string
}

variable "service_principal" {
  type = string
}

variable "azure_service_principal_credentials" {
  type = map(any)
}
