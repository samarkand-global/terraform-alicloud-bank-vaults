resource "alicloud_oss_bucket" "bank_vaults" {
  bucket = var.oss_bucket_name
  acl    = "private"
  tags   = var.tags
}

resource "alicloud_kms_key" "bank_vaults" {
  description            = var.kms_key_description
  pending_window_in_days = var.kms_key_pending_window_in_days
}

resource "alicloud_ram_user" "bank_vaults" {
  name = var.ram_user_name
}

resource "alicloud_ram_access_key" "bank_vaults" {
  user_name = alicloud_ram_user.bank_vaults.name
}

resource "alicloud_ram_policy" "bank_vaults" {
  policy_name = var.ram_policy_name

  policy_document = <<EOF
  {
    "Statement": [
      {
        "Action": [
          "oss:ListObjects",
          "oss:GetObject",
          "oss:PutObject"
        ],
        "Effect": "Allow",
        "Resource": [
          "acs:oss:*:${var.alicloud_account_id}:${alicloud_oss_bucket.bank_vaults.bucket}",
          "acs:oss:*:${var.alicloud_account_id}:${alicloud_oss_bucket.bank_vaults.bucket}/*"
        ]
      },
      {
        "Action": "kms:*",
        "Effect": "Allow",
        "Resource": "${alicloud_kms_key.bank_vaults.arn}"
      }

    ],
      "Version": "1"
  }
  EOF

  force = true
}

resource "alicloud_ram_user_policy_attachment" "bank_vaults" {
  policy_name = alicloud_ram_policy.bank_vaults.name
  policy_type = alicloud_ram_policy.bank_vaults.type
  user_name   = alicloud_ram_user.bank_vaults.name
}

