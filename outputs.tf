output "name" {
  value       = kubernetes_secret.secret.metadata[0].name
  description = "Secret's name"
}

output "namespace" {
  value       = kubernetes_secret.secret.metadata[0].namespace
  description = "Secret's namespace"
}
