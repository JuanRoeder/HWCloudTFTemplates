#recursos de la VPC 1

resource "huaweicloud_vpc" "vpc_name1" {
    name = vpc_name1
    cidr = "192.168.0.0/16"
}

resource "huaweicloud_vpc_subnet" "subnet-default1" {
    name              = "subnet-default1"
    cidr              = "192.168.0.0/24"
    gateway_ip        = "192.168.0.1"
    vpc_id            = huaweicloud_vpc.vpc_name1.id
    availability_zone = "${local.enum_regions.LA-Santiago}a"
}

#recursos de la VPC 2

resource "huaweicloud_vpc" "vpc_name2" {
    name = vpc_name2
    cidr = "10.0.0.0/8"
}

resource "huaweicloud_vpc_subnet" "subnet-default2" {
    name              = "subnet-default2"
    cidr              = "10.0.0.0/24"
    gateway_ip        = "10.0.0.1"
    vpc_id            = huaweicloud_vpc.vpc_name2.id
    availability_zone = "${local.enum_regions.LA-Santiago}a"
}