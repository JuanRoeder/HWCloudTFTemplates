data "huaweicloud_enterprise_project" "enterprise_project"{
  name = "TestJC"
}

data "huaweicloud_images_image" "windows" {
  most_recent  = true
  architecture = "x86"
  os           = "Windows"
  visibility   = "public"
  image_type = local.enum_image_type.ECS
  name = local.enum_images.windows.WS2019-Datacenter-EN
}

data "huaweicloud_networking_secgroup" "secgroup" {
  name = "default"
}

data "huaweicloud_vpc_subnet" "subnet" {
  name = "subnet-default"
}

module "ecsResources" {
  source = "./computing/ecs"
  providers = {
    huaweicloud = huaweicloud
  }
  for_each = toset(["ecs-terraform-01", "ecs-terraform-02"])
  name = each.value
  admin_pass = "Huawei@2024."
  flavor_id = "s6.xlarge.2"
  image_id = data.huaweicloud_images_image.windows.id
  system_disk = {
    "type" = local.enum_disk_type.General-purpose-SSD
    size = 100
  }
  network_id = toset([tomap({
    uuid = data.huaweicloud_vpc_subnet.subnet.id
  })])
  security_group_ids = [data.huaweicloud_networking_secgroup.secgroup.id]
}

output "ecsResources" {
  /*value = {
    for k, v in module.ecsResources : k => v.id
  }*/
  value = module.ecsResources
  depends_on = [ module.ecsResources ]
  sensitive = true
}