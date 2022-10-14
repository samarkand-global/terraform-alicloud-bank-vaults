# Provider configuration
variable "alicloud_region" {
  type = string
}

variable "kubernetes_provider_config_path" {
  type    = string
  default = null
}

variable "kubernetes_provider_config_context" {
  type    = string
  default = null
}

variable "kubernetes_provider_host" {
  type    = string
  default = null
}

variable "kubernetes_provider_client_certificate" {
  type    = string
  default = null
}

variable "kubernetes_provider_client_key" {
  type      = string
  default   = null
  sensitive = true
}

variable "kubernetes_provider_cluster_ca_certificate" {
  type    = string
  default = null
}


# Global configuration
variable "label" {
  type = string
}


# Bank Vaults configuration
variable "alicloud_account_id" {
  type = number
}

variable "bank_vaults_kms_key_pending_window_in_days" {
  type    = number
  default = 30
}

variable "bank_vaults_oss_bucket_name_prefix" {
  type    = string
  default = "smk"
}

variable "default_tags" {
  type    = map(string)
  default = {}
}


# Vault cluster configuration
variable "vault_cluster_kubernetes_namespace" {
  type    = string
  default = "vault"
}

variable "vault_cluster_kubernetes_service_account_name" {
  type    = string
  default = "vault"
}

variable "vault_cluster_name" {
  type    = string
  default = null
}

variable "vault_cluster_size" {
  type    = number
  default = 1
}

variable "vault_cluster_annotations" {
  type    = map(string)
  default = {}
}

variable "vault_image" {
  type = string
}

variable "vault_ingress_hostname" {
  type = string
}

variable "vault_ingress_class_name" {
  type = string
}

variable "vault_ingress_annotations" {
  type    = map(string)
  default = {}
}

variable "vault_log_level" {
  type    = string
  default = "info"
}

variable "vault_storage_size" {
  type    = string
  default = "20Gi"
}

variable "vault_storage_class" {
  type    = string
  default = "alicloud-disk-ssd"
}

variable "vault_external_config" {
  type    = any
  default = null
}
