#Security Group

resource "huaweicloud_networking_secgroup" "sg-terraform" {
    name                 = "sg-terraform"
    delete_default_rules = true
}

resource "huaweicloud_networking_secgroup_rule" "rule1" {
    security_group_id = huaweicloud_networking_secgroup.sg-terraform.id
    action                  = local.enum_vpc.action_type.ALLOW
    priority                = 1 #Eliminar si 1 por defecto
    direction               = local.enum_vpc.secgroup_type.inbound
    ethertype               = local.enum_vpc.ip_version.IPv4
    remote_group_id         = huaweicloud_networking_secgroup.sg-terraform.id
}