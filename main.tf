module "bank_vaults" {
  source = "./modules/bank-vaults"

  alicloud_account_id            = var.alicloud_account_id
  kms_key_description            = "bank-vaults-${var.label}"
  kms_key_pending_window_in_days = var.bank_vaults_kms_key_pending_window_in_days
  oss_bucket_name                = "${var.bank_vaults_oss_bucket_name_prefix}-bank-vaults-${var.label}"
  ram_policy_name                = "bank-vaults-${var.label}-kms-oss-access"
  ram_user_name                  = "bank-vaults-${var.label}"
  tags                           = merge(var.default_tags, { "app" = var.label })
}

module "vault_cluster" {
  source = "./modules/vault-cluster"

  kubernetes_namespace        = var.vault_cluster_kubernetes_namespace
  kubernetes_service_account  = var.vault_cluster_kubernetes_service_account_name
  bank_vaults_ram_credentials = module.bank_vaults.ram_credentials
  bank_vaults_kms_key_id      = module.bank_vaults.kms_key_id
  bank_vaults_kms_key_region  = var.alicloud_region
  bank_vaults_oss_bucket      = module.bank_vaults.oss_bucket_id
  bank_vaults_oss_endpoint    = module.bank_vaults.oss_bucket_intranet_endpoint
  bank_vaults_oss_prefix      = var.label

  labels      = { "app" = var.label }
  annotations = var.default_tags

  vault_cluster_name        = var.vault_cluster_name != null ? var.vault_cluster_name : var.label
  vault_cluster_size        = var.vault_cluster_size
  vault_cluster_annotations = var.vault_cluster_annotations
  vault_image               = var.vault_image
  vault_ingress_hostname    = var.vault_ingress_hostname
  vault_ingress_class_name  = var.vault_ingress_class_name
  vault_ingress_annotations = var.vault_ingress_annotations
  vault_log_level           = var.vault_log_level
  vault_storage_size        = var.vault_storage_size
  vault_storage_class       = var.vault_storage_class
  vault_external_config     = var.vault_external_config

  depends_on = [module.bank_vaults]
}
