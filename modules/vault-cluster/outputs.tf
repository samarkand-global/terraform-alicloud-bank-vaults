output "kubernetes_service_account_name" {
  value = kubernetes_service_account.vault_cluster.metadata.0.name
}

output "kubernetes_service_account_namespace" {
  value = kubernetes_service_account.vault_cluster.metadata.0.namespace
}
