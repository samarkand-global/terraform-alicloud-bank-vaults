variable "kubernetes_namespace" {
  type = string
}

variable "kubernetes_service_account" {
  type = string
}

variable "bank_vaults_ram_credentials" {
  type      = map(string)
  sensitive = true
}

variable "bank_vaults_kms_key_id" {
  type = string
}

variable "bank_vaults_kms_key_region" {
  type = string
}

variable "bank_vaults_oss_bucket" {
  type = string
}

variable "bank_vaults_oss_endpoint" {
  type = string
}

variable "bank_vaults_oss_prefix" {
  type = string
}

variable "labels" {
  type    = map(string)
  default = null
}

variable "annotations" {
  type    = map(string)
  default = null
}

variable "vault_cluster_name" {
  type = string
}

variable "vault_cluster_size" {
  type = number
}

variable "vault_cluster_annotations" {
  type = map(string)
}

variable "vault_image" {
  type = string
}

variable "vault_ingress_annotations" {
  type    = map(string)
  default = {}
}

variable "vault_ingress_hostname" {
  type = string
}

variable "vault_ingress_class_name" {
  type = string
}

variable "vault_storage_size" {
  type = string
}

variable "vault_storage_class" {
  type = string
}

variable "vault_log_level" {
  type = string
}

variable "vault_external_config" {
  type = any
}
