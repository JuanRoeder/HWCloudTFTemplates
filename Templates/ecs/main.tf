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

data "huaweicloud_images_image" "windows" {
    most_recent  = true
    architecture = local.enum_ims.architecture.x86
    os           = local.enum_ims.os_type.windows.name
    visibility   = local.enum_ims.visibility.Public
    image_type   = local.enum_ims.image_type.ECS
    name         = local.enum_ims.os_type.windows.WS2019-Datacenter-EN
}

resource "huaweicloud_compute_instance" "ServerName" {
    enterprise_project_id = "enterprise_project_id"#retirar si se usa el Default
    name               = "ServerName"
    image_id           = data.huaweicloud_images_image.windows.id
    flavor_id          = "s6.large.2"
    security_group_ids = [huaweicloud_networking_secgroup.sg-terraform.id]
    availability_zone  = "${local.enum_regions.LA-Santiago}a"#region+a|b si es AZ1|AZ2 

    system_disk_type = local.enum_evs.type.General-purpose-SSD
    system_disk_size = 100

    data_disks {
      type = local.enum_evs.type.High-IO
      size = 100
    }

    network {
      uuid = "subnet_id"#network_id (en caso de Lima)
      fixed_ip_v4 = "IP Address"#no considerar si es automática
    }
}