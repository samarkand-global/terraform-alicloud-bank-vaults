output "oss_bucket_id" {
  value = alicloud_oss_bucket.bank_vaults.id
}

output "oss_bucket_intranet_endpoint" {
  value = alicloud_oss_bucket.bank_vaults.intranet_endpoint
}

output "oss_bucket_extranet_endpoint" {
  value = alicloud_oss_bucket.bank_vaults.extranet_endpoint
}

output "kms_key_id" {
  value = alicloud_kms_key.bank_vaults.id
}

output "ram_credentials" {
  value = {
    "ALIBABA_ACCESS_KEY_ID"     = alicloud_ram_access_key.bank_vaults.id
    "ALIBABA_ACCESS_KEY_SECRET" = alicloud_ram_access_key.bank_vaults.secret
  }
  sensitive = true
}
