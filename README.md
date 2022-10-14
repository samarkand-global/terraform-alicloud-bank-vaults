Bootstrap [Bank Vaults](https://banzaicloud.com/docs/bank-vaults/overview/) on Alicloud then configure and apply a Vault CRD to create a Vault cluster.

This module assumes that the [Vault Operator](https://banzaicloud.com/docs/bank-vaults/operator/) is already running (with CRD installed) in the target Kubernetes cluster.
<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_alicloud"></a> [alicloud](#requirement\_alicloud) | ~> 1.187 |
| <a name="requirement_kubernetes"></a> [kubernetes](#requirement\_kubernetes) | ~> 2.14 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_bank_vaults"></a> [bank\_vaults](#module\_bank\_vaults) | ./modules/bank-vaults | n/a |
| <a name="module_vault_cluster"></a> [vault\_cluster](#module\_vault\_cluster) | ./modules/vault-cluster | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_alicloud_account_id"></a> [alicloud\_account\_id](#input\_alicloud\_account\_id) | Bank Vaults configuration | `number` | n/a | yes |
| <a name="input_alicloud_region"></a> [alicloud\_region](#input\_alicloud\_region) | Provider configuration | `string` | n/a | yes |
| <a name="input_bank_vaults_kms_key_pending_window_in_days"></a> [bank\_vaults\_kms\_key\_pending\_window\_in\_days](#input\_bank\_vaults\_kms\_key\_pending\_window\_in\_days) | n/a | `number` | `30` | no |
| <a name="input_bank_vaults_oss_bucket_name_prefix"></a> [bank\_vaults\_oss\_bucket\_name\_prefix](#input\_bank\_vaults\_oss\_bucket\_name\_prefix) | n/a | `string` | `"smk"` | no |
| <a name="input_default_tags"></a> [default\_tags](#input\_default\_tags) | n/a | `map(string)` | `{}` | no |
| <a name="input_kubernetes_provider_client_certificate"></a> [kubernetes\_provider\_client\_certificate](#input\_kubernetes\_provider\_client\_certificate) | n/a | `string` | `null` | no |
| <a name="input_kubernetes_provider_client_key"></a> [kubernetes\_provider\_client\_key](#input\_kubernetes\_provider\_client\_key) | n/a | `string` | `null` | no |
| <a name="input_kubernetes_provider_cluster_ca_certificate"></a> [kubernetes\_provider\_cluster\_ca\_certificate](#input\_kubernetes\_provider\_cluster\_ca\_certificate) | n/a | `string` | `null` | no |
| <a name="input_kubernetes_provider_config_context"></a> [kubernetes\_provider\_config\_context](#input\_kubernetes\_provider\_config\_context) | n/a | `string` | `null` | no |
| <a name="input_kubernetes_provider_config_path"></a> [kubernetes\_provider\_config\_path](#input\_kubernetes\_provider\_config\_path) | n/a | `string` | `null` | no |
| <a name="input_kubernetes_provider_host"></a> [kubernetes\_provider\_host](#input\_kubernetes\_provider\_host) | n/a | `string` | `null` | no |
| <a name="input_label"></a> [label](#input\_label) | Global configuration | `string` | n/a | yes |
| <a name="input_vault_cluster_annotations"></a> [vault\_cluster\_annotations](#input\_vault\_cluster\_annotations) | n/a | `map(string)` | `{}` | no |
| <a name="input_vault_cluster_kubernetes_namespace"></a> [vault\_cluster\_kubernetes\_namespace](#input\_vault\_cluster\_kubernetes\_namespace) | Vault cluster configuration | `string` | `"vault"` | no |
| <a name="input_vault_cluster_kubernetes_service_account_name"></a> [vault\_cluster\_kubernetes\_service\_account\_name](#input\_vault\_cluster\_kubernetes\_service\_account\_name) | n/a | `string` | `"vault"` | no |
| <a name="input_vault_cluster_name"></a> [vault\_cluster\_name](#input\_vault\_cluster\_name) | n/a | `string` | `null` | no |
| <a name="input_vault_cluster_size"></a> [vault\_cluster\_size](#input\_vault\_cluster\_size) | n/a | `number` | `1` | no |
| <a name="input_vault_external_config"></a> [vault\_external\_config](#input\_vault\_external\_config) | n/a | `any` | `null` | no |
| <a name="input_vault_image"></a> [vault\_image](#input\_vault\_image) | n/a | `string` | n/a | yes |
| <a name="input_vault_ingress_annotations"></a> [vault\_ingress\_annotations](#input\_vault\_ingress\_annotations) | n/a | `map(string)` | `{}` | no |
| <a name="input_vault_ingress_class_name"></a> [vault\_ingress\_class\_name](#input\_vault\_ingress\_class\_name) | n/a | `string` | n/a | yes |
| <a name="input_vault_ingress_hostname"></a> [vault\_ingress\_hostname](#input\_vault\_ingress\_hostname) | n/a | `string` | n/a | yes |
| <a name="input_vault_log_level"></a> [vault\_log\_level](#input\_vault\_log\_level) | n/a | `string` | `"info"` | no |
| <a name="input_vault_storage_class"></a> [vault\_storage\_class](#input\_vault\_storage\_class) | n/a | `string` | `"alicloud-disk-ssd"` | no |
| <a name="input_vault_storage_size"></a> [vault\_storage\_size](#input\_vault\_storage\_size) | n/a | `string` | `"20Gi"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_vault_address"></a> [vault\_address](#output\_vault\_address) | n/a |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
