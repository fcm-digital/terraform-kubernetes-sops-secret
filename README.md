# Terraform Kubernetes SOPS secret module

This module creates a Kubernetes secrets using a SOPS-encrypted file as a source for
the .data portion of a Kubernetes secret.

If you want to create this Kubernetes secret:

```yaml
---
apiVersion: v1
kind: Secret
type: Opaque
metadata:
  name: test
data:
  username: VVNFUk5BTUUK
  password: UEFTU1dPUkQK
```

the secret SOPS file should be like:

```yaml
---
username: USERNAME
password: PASSWORD
```

and encrypted with SOPS:

```bash
$ sops --encrypt --kms arn:aws:kms:us-east-1:656532927350:key/920aff2e-c5f1-4040-943a-047fa387b27e secrets.yaml
```

## Requirements

| Name       | Version   |
|:-----------|:----------|
| terraform  | >= 0.13.0 |
| kubernetes | >= 2.0    |
| sops       | >= 0.6.3  |

## Providers

| Name       | Version  |
|:-----------|:---------|
| kubernetes | >= 2.0   |
| sops       | >= 0.6.3 |

## Inputs

| Name        | Description                    | Type          | Default     | Required |
|:------------|:-------------------------------|:--------------|:------------|:--------:|
| annotations | Annotations for the secret     | `map(string)` | `{}`        |    no    |
| file        | Name of the encrypted file     | `string`      | n/a         |   yes    |
| labels      | Labels for the secret          | `map(string)` | `{}`        |    no    |
| name        | Name of the secret             | `string`      | n/a         |   yes    |
| namespace   | Namespace to create the secret | `string`      | `"default"` |    no    |
| type        | Kubernetes type of secret      | `string`      | `"Opaque"`  |    no    |

## Outputs

| Name      | Description        |
|:----------|:-------------------|
| name      | Secret's name      |
| namespace | Secret's namespace |
