resource "kubernetes_manifest" "vault_cluster" {
  manifest = {
    "apiVersion" = "vault.banzaicloud.com/v1alpha1"
    "kind"       = "Vault"
    "metadata" = {
      "name"      = "${var.vault_cluster_name}"
      "namespace" = "${kubernetes_namespace.vault_cluster.metadata.0.name}"
    }
    "spec" = {
      "annotations" = var.vault_cluster_annotations

      "config" = {
        "api_addr"     = "https://${var.vault_cluster_name}.${kubernetes_namespace.vault_cluster.metadata.0.name}:8200"
        "cluster_addr" = "https://$${.Env.POD_NAME}:8201"
        "listener" = {
          "tcp" = {
            "address"       = "0.0.0.0:8200"
            "tls_cert_file" = "/vault/tls/server.crt"
            "tls_key_file"  = "/vault/tls/server.key"
          }
        }
        "storage" = {
          "raft" = {
            "path"           = "/vault/file"
            "auto_join_port" = "443"
          }
        }
        "telemetry" = {
          "statsd_address" = "localhost:9125"
        }
        "ui" = true
      }
      "envsConfig" = [
        {
          "name" = "BANK_VAULTS_ALIBABA_ACCESS_KEY_ID"
          "valueFrom" = {
            "secretKeyRef" = {
              "key"  = "ALIBABA_ACCESS_KEY_ID"
              "name" = "${kubernetes_secret.bank_vaults_ram_credentials.metadata.0.name}"
            }
          }
        },
        {
          "name" = "BANK_VAULTS_ALIBABA_ACCESS_KEY_SECRET"
          "valueFrom" = {
            "secretKeyRef" = {
              "key"  = "ALIBABA_ACCESS_KEY_SECRET"
              "name" = "${kubernetes_secret.bank_vaults_ram_credentials.metadata.0.name}"
            }
          }
        }
      ]
      "externalConfig" = var.vault_external_config
      "image"          = "${var.vault_image}"
      "ingress" = {
        "annotations" = var.vault_ingress_annotations
        "spec" = {
          "rules" = [
            {
              "host" = "${var.vault_ingress_hostname}"
              "http" = {
                "paths" = [
                  {
                    "backend" = {
                      "service" = {
                        "name" = "${var.vault_cluster_name}"
                        "port" = {
                          "name" = "api-port"
                        }
                      }
                    }
                    "path"     = "/"
                    "pathType" = "ImplementationSpecific"
                  }
                ]
              }
            }
          ]
          "tls" = [
            {
              "hosts"      = ["${var.vault_ingress_hostname}"]
              "secretName" = "${replace(var.vault_ingress_hostname, ".", "-")}-cert"
            }
          ]
          "ingressClassName" = "${var.vault_ingress_class_name}"
        }
      }
      "serviceAccount" = "${kubernetes_service_account.vault_cluster.metadata.0.name}"
      "serviceType"    = "ClusterIP"
      "size"           = var.vault_cluster_size
      "unsealConfig" = {
        "alibaba" = {
          "kmsKeyId"    = "${var.bank_vaults_kms_key_id}"
          "kmsRegion"   = "${var.bank_vaults_kms_key_region}"
          "ossBucket"   = "${var.bank_vaults_oss_bucket}"
          "ossEndpoint" = "${var.bank_vaults_oss_endpoint}"
          "ossPrefix"   = "${var.bank_vaults_oss_prefix}"
        }
      }
      "vaultEnvsConfig" = [
        {
          "name"  = "VAULT_LOG_LEVEL"
          "value" = "${var.vault_log_level}"
        },
      ]
      "volumeClaimTemplates" = [
        {
          "metadata" = {
            "name" = "vault-raft"
          }
          "spec" = {
            "accessModes" = [
              "ReadWriteOnce",
            ]
            "resources" = {
              "requests" = {
                "storage" = "${var.vault_storage_size}"
              }
            }
            "storageClassName" = "${var.vault_storage_class}"
          }
        },
      ]
      "volumeMounts" = [
        {
          "mountPath" = "/vault/file"
          "name"      = "vault-raft"
        }
      ]
    }
  }
}


