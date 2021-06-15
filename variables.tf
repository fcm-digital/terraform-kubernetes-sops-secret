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

variable "namespace" {
  type        = string
  description = "Namespace to create the secret"
  default     = "default"
}

variable "labels" {
  type        = map(string)
  description = "Labels for the secret"
  default     = {}
}

variable "annotations" {
  type        = map(string)
  description = "Annotations for the secret"
  default     = {}
}
