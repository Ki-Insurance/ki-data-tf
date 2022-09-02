variable "azure_service_principals" {
  type = map(any)
}

variable "azure_rbac" {
  type = list(object({
    service_principal = string
    scope             = string
    role              = string
  }))
  default = []
}
