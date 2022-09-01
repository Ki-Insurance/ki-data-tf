variable "project" {
  type        = string
  description = "GCP Project ID"
}

variable "region" {
  type        = string
  default     = "europe-west2"
  description = "App Engine Region"
}

variable "project_bindings" {
  type    = map(list(string))
  default = {}

}

variable "service_accounts" {
  type        = list(string)
  default     = []
  description = "List of service accounts to create"
}


variable "iam_service_account" {
  type = list(object({
    resource = string
    bindings = map(list(string))
  }))
  default     = []
  description = "List of binding associated to service accounts"
}
