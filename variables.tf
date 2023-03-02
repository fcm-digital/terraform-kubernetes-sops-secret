variable "file" {
  type        = string
  description = "Name of the encrypted file"
}

variable "type" {
  type        = string
  description = "Kubernetes type of secret"
  default     = "Opaque"
}

variable "name" {
  type        = string
  description = "Name of the secret"
}

variable "namespaces" {
  type        = set(string)
  description = "Namespace to create the secret"
  default     = ["default"]
}

variable "labels" {
  type        = map(map(string))
  description = "Labels for the secret"
  default = {
    all = {}
  }
}

variable "annotations" {
  type        = map(map(string))
  description = "Annotations for the secret"
  default = {
    all = {}
  }
}

variable "wait_for_service_account_token" {
  type        = bool
  default     = false
  description = "Terraform will wait for the service account token to be created"
}