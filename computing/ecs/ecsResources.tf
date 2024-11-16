resource "huaweicloud_compute_instance" "ecsResource" {
  enterprise_project_id = var.enterprise_project_id
  name               = var.name
  image_id           = var.image_id
  flavor_id          = var.flavor_id
  security_group_ids = var.security_group_ids
  availability_zone  = var.availability_zone

  system_disk_type = var.system_disk.type
  system_disk_size = var.system_disk.size

  dynamic "data_disks" {
    for_each = var.data_disks != null? var.data_disks : []
    content {
      type = data_disks.value.type
      size = data_disks.value.size
    }    
  }

  dynamic network {
    for_each = var.network_id
    content {
      uuid = network.value.uuid
    }
  }
}

output "ecsResource" {
  value = huaweicloud_compute_instance.ecsResource
  depends_on = [ huaweicloud_compute_instance.ecsResource ]
}