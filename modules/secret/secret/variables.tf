variable "secret" {
  type = object({
    name                      = string
    value_from_iap_credential = optional(string)
    value_from_service_principal = optional(string)
  })
}

variable "project" {
  type = string
}

variable "region" {
  type = string
}

variable "replica_region" {
  type = string
}

variable "azure_service_principal_credentials" {
  type = map(any)
}
