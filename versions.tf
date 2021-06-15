terraform {
  required_version = ">= 0.13.0"
  required_providers {
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = ">= 2.0"
    }
    sops = {
      source  = "carlpett/sops"
      version = ">= 0.6.3"
    }
  }
}
