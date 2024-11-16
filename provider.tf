terraform {
  required_providers {
    huaweicloud = {
      source  = "huaweicloud/huaweicloud"
      version = ">= 1.36.0"
    }
  }
  required_version = ">= 0.13"
}

# Configure the HuaweiCloud Provider
provider "huaweicloud" {
  region = local.enum_regions.LA-Santiago
  access_key = "${var.HWCLOUD_AK}"
  secret_key = "${var.HWCLOUD_SK}"
}