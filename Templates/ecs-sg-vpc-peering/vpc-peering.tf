#recursos de peering

resource "huaweicloud_vpc_peering_connection" "peering" {
    name        = "peering_vpc_name1_vpc_name2"
    vpc_id      = huaweicloud_vpc.vpc_name1.id
    peer_vpc_id = huaweicloud_vpc.vpc_name2.id
}

#creacion de rutas

resource "huaweicloud_vpc_route" "vpc_route_vpc_name1" {
    vpc_id      = huaweicloud_vpc.vpc_name1.id
    destination = "10.0.0.0/8"
    type        = local.enum_vpc.route_type.VPC-Peering
    nexthop     = huaweicloud_vpc.vpc_name2.id
}

resource "huaweicloud_vpc_route" "vpc_route_vpc_name2" {
    vpc_id      = huaweicloud_vpc.vpc_name2.id
    destination = "192.168.0.0/16"
    type        = local.enum_vpc.route_type.VPC-Peering
    nexthop     = huaweicloud_vpc.vpc_name1.id
}