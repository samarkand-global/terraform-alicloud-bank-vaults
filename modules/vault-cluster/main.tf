resource "kubernetes_namespace" "vault_cluster" {
  metadata {
    name        = var.kubernetes_namespace
    labels      = var.labels
    annotations = var.annotations
  }
}

resource "kubernetes_secret" "bank_vaults_ram_credentials" {
  metadata {
    name        = "alicloud"
    namespace   = kubernetes_namespace.vault_cluster.metadata.0.name
    labels      = var.labels
    annotations = var.annotations
  }

  data = var.bank_vaults_ram_credentials
}

resource "kubernetes_service_account" "vault_cluster" {
  metadata {
    name        = var.kubernetes_service_account
    namespace   = kubernetes_namespace.vault_cluster.metadata.0.name
    labels      = var.labels
    annotations = var.annotations
  }
}

resource "kubernetes_role" "vault_cluster" {
  metadata {
    name        = "vault"
    namespace   = kubernetes_namespace.vault_cluster.metadata.0.name
    labels      = var.labels
    annotations = var.annotations
  }

  rule {
    api_groups = [""]
    resources  = ["secrets"]
    verbs      = ["*"]
  }
  rule {
    api_groups = [""]
    resources  = ["pods"]
    verbs      = ["get", "update", "patch"]
  }
}

resource "kubernetes_role_binding" "vault" {
  metadata {
    name        = "vault"
    namespace   = kubernetes_namespace.vault_cluster.metadata.0.name
    labels      = var.labels
    annotations = var.annotations
  }

  role_ref {
    kind      = "Role"
    name      = kubernetes_role.vault_cluster.metadata.0.name
    api_group = "rbac.authorization.k8s.io"
  }

  subject {
    kind      = "ServiceAccount"
    name      = kubernetes_service_account.vault_cluster.metadata.0.name
    namespace = kubernetes_namespace.vault_cluster.metadata.0.name
  }
}

# resource "kubernetes_cluster_role_binding" "vault_auth_delegator" {
# metadata {
#   name        = "vault-auth-delegator"
#   labels      = var.labels
#   annotations = var.annotations
# }
#
# role_ref {
#   api_group = "rbac.authorization.k8s.io"
#   kind      = "ClusterRole"
#   name      = "system:auth-delegator"
# }
#
# subject {
#   kind      = "ServiceAccount"
#   name      = kubernetes_service_account.vault_cluster.metadata.0.name
#   namespace = kubernetes_namespace.vault_cluster.metadata.0.name
# }
# }
