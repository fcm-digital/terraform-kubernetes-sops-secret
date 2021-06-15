/**
 * # Terraform Kubernetes SOPS secret module
 *
 * This module creates a Kubernetes secrets using a SOPS-encrypted file as a source for
 * the .data portion of a Kubernetes secret.
 *
 * If you want to create this Kubernetes secret:
 *
 * ```yaml
 * ---
 * apiVersion: v1
 * kind: Secret
 * type: Opaque
 * metadata:
 *   name: test
 * data:
 *   username: VVNFUk5BTUUK
 *   password: UEFTU1dPUkQK
 * ```
 *
 * the secret SOPS file should be like:
 *
 * ```yaml
 * ---
 * username: USERNAME
 * password: PASSWORD
 * ```
 *
 * and encrypted with SOPS:
 *
 * ```bash
 * $ sops --encrypt --kms arn:aws:kms:us-east-1:656532927350:key/920aff2e-c5f1-4040-943a-047fa387b27e secrets.yaml
 * ```
 */
data "sops_file" "secret" {
  source_file = var.file
}

resource "kubernetes_secret" "secret" {
  metadata {
    annotations = var.annotations
    labels      = var.labels
    name        = var.name
    namespace   = var.namespace
  }

  type = var.type

  data = { for k, v in data.sops_file.secret.data : k => v }
}
