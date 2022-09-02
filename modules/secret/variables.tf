variable "secrets" {
  type = list(object({
    name                      = string
    value_from_iap_credential = optional(string)
    value_from_service_principal = optional(string)
  }))
  default     = []
  description = "List Secrets configuration"
}

variable "iam_secrets" {
  type = list(object({
    resource = string
    bindings = map(list(string))
  }))
  default     = []
  description = "List of IAM binding associated to the secrets"
}

variable "project" {
  type        = string
  description = "GCP project id"
}

variable "region" {
  type        = string
  default     = "europe-west2"
  description = "Secrets region"
}

variable "replica_region" {
  type        = string
  default     = "europe-west1"
  description = "Secrets replica region"
}

variable "iap_client_credentials" {
  type        = map(string)
  description = "IAP Client Credentials"
  default     = {}
}

variable "azure_service_principal_credentials" {
  type = map(any)
  default = {}
}
