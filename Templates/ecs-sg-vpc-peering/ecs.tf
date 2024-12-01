data "huaweicloud_images_image" "CentOS" {
    most_recent  = true
    architecture = local.enum_ims.architecture.x86
    os           = local.enum_ims.os_type.CentOS.name
    visibility   = local.enum_ims.visibility.Public
    image_type   = local.enum_ims.image_type.ECS
    name         = local.enum_ims.os_type.CentOS.CentOS-8-2
}

resource "huaweicloud_compute_instance" "Server1" {
    name               = "Server1"
    image_id           = data.huaweicloud_images_image.CentOS.id
    flavor_id          = "s6.large.2"
    security_group_ids = [huaweicloud_networking_secgroup.sg-terraform.id]
    availability_zone  = "${local.enum_regions.LA-Santiago}a"

    system_disk_type = local.enum_evs.type.General-purpose-SSD
    system_disk_size = 100

    network {
      uuid = huaweicloud_vpc_subnet.subnet-default1.id
    }
}

resource "huaweicloud_compute_instance" "Server2" {
    name               = "Server2"
    image_id           = data.huaweicloud_images_image.CentOS.id
    flavor_id          = "s6.large.2"
    security_group_ids = [huaweicloud_networking_secgroup.sg-terraform.id]
    availability_zone  = "${local.enum_regions.LA-Santiago}b"

    system_disk_type = local.enum_evs.type.General-purpose-SSD
    system_disk_size = 100

    network {
      uuid = huaweicloud_vpc_subnet.subnet-default2.id
    }
}