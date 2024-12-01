variable "Servers" {
    default = {
        "ServerName1" = {
            enterprise_project_id = "enterprise_project_id"
            availability_zone = "la-south2a"#region+a|b si es AZ1|AZ2 
            flavor_id = "s6.large.2"
            image_id = "image_id"
            subnet_id = "subnet_id"#network_id (en caso de Lima)
            fixed_ip_v4 = "IP Address"
            security_group_ids = ["security_group_ids"]
            admin_pass = "admin_pass"
            system_disk = {
              type = "GPSSD" #check local.enum_evs.type running terraform console in terminal 
              size = 100
            }
            data_disk = {
              type = "SAS"
              size = 100
            }
            tags = {
                key1 = "value1"
                key2 = "value2"
            }
        }
        "ServerName2" = {
            enterprise_project_id = "enterprise_project_id"
            availability_zone = "la-south2b"#region+a|b si es AZ1|AZ2 
            flavor_id = "s6.large.4"
            image_id = "image_id"
            subnet_id = "subnet_id"
            fixed_ip_v4 = "IP Address"
            security_group_ids = ["security_group_ids"]
            admin_pass = "admin_pass"
            system_disk = {
              type = "GPSSD"
              size = 100
            }
            tags = {
                key1 = "value1"
                key2 = "value2"
            }
        }
    }
}
resource "huaweicloud_compute_instance" "Servers" {
    for_each           = var.Servers
    enterprise_project_id = each.value.enterprise_project_id#retirar si se usa el Default
    name               = each.key
    admin_pass         = each.value.admin_pass
    image_id           = each.value.image_id
    flavor_id          = each.value.flavor_id
    security_group_ids = each.value.security_group_ids
    availability_zone  = each.value.availability_zone

    system_disk_type   = each.value.system_disk.type
    system_disk_size   = each.value.system_disk.size

    dynamic "data_disks" {
      for_each = each.value.data_disk != null? each.value.data_disk : []
      content {
        type = data_disks.value.type
        size = data_disks.value.size
      }
    }

    network {
      uuid             = each.value.subnet_id
      fixed_ip_v4      = each.value.fixed_ip_v4#no considerar si es automática
    }

    tags = each.value.tags
}