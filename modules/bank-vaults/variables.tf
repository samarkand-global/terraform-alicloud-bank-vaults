variable "alicloud_account_id" {
  type = number
}

variable "kms_key_description" {
  type    = string
  default = null
}

variable "kms_key_pending_window_in_days" {
  type    = number
  default = null
}

variable "oss_bucket_name" {
  type = string
}

variable "ram_policy_name" {
  type = string
}

variable "ram_user_name" {
  type = string
}

variable "tags" {
  type    = map(string)
  default = {}
}
