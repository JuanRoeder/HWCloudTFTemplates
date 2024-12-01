variable "HWCLOUD_SK" {
    description = "Secret-key"
    type = string
    sensitive = true
}

variable "HWCLOUD_AK" {
    description = "Access-key"
    type = string
    sensitive = true
}

variable "HWCLOUD_REGION" {
    description = "Region"
    type = string
    default = ""
}

variable "HWCLOUD_PROJECTID" {
    description = "Project ID"
    type = string
    default = ""
}