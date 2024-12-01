module "HWCloudTFLib" {
  source = "git::https://github.com/JuanRoeder/HWCloudTFLib.git?ref=v1.6.2"
}

locals {
  enum_regions = module.HWCloudTFLib.enum_regions
  enum_commons = module.HWCloudTFLib.enum_commons
  enum_ecs = module.HWCloudTFLib.enum_ecs
  enum_evs = module.HWCloudTFLib.enum_evs
  enum_ims = module.HWCloudTFLib.enum_ims
  enum_vpc = module.HWCloudTFLib.enum_vpc
  enum_eip = module.HWCloudTFLib.enum_eip
  enum_vpn = module.HWCloudTFLib.enum_vpn
}