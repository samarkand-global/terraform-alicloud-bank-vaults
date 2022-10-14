terraform {
  required_providers {
    alicloud = {
      source  = "aliyun/alicloud"
      version = "~> 1.187"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~> 2.14"
    }
  }
}

provider "alicloud" {
  region = var.alicloud_region
}

provider "kubernetes" {
  config_path            = var.kubernetes_provider_config_path
  config_context         = var.kubernetes_provider_config_context
  host                   = var.kubernetes_provider_host
  client_certificate     = var.kubernetes_provider_client_certificate
  client_key             = var.kubernetes_provider_client_key
  cluster_ca_certificate = var.kubernetes_provider_cluster_ca_certificate
}
