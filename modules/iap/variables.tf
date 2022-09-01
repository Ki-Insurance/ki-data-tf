variable "support_email" {
  type        = string
  description = "IAP application support email"
}

variable "application_title" {
  type        = string
  description = "IAP application title"
}

variable "project" {
  type        = string
  description = "GCP project id"
}

variable "bindings" {
  type        = map(list(string))
  default     = {}
  description = "IAM Bindings on the IAP app"
}
