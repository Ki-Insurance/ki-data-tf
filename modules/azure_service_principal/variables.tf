variable "azure_service_principals" {
  type = list(object({
    name     = string
    owners   = list(string)
    duration = optional(string)
  }))
  default = []
}
