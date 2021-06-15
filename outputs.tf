output "name" {
  value       = kubernetes_secret.secret.metadata[0].name
  description = "Secret's name"
}

output "namespace" {
  value       = kubernetes_secret.secret.metadata[0].namespace
  description = "Secret's namespace"
}

/**
 * Safe to use. Keys of .data should not be a secret, and allow to retrieve
 * secret values from another resources
 */
output "keys" {
  value       = keys(nonsensitive(kubernetes_secret.secret.data))
  description = "List of keys for the Kubernetes secret"
}
