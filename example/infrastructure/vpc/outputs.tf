output "vpc01" {
  value = {
    arn                       = module.vpc.template.arn
    id                        = module.vpc.template.id
    cidr_block                = module.vpc.template.cidr_block
    instance_tenancy          = module.vpc.template.instance_tenancy
    enable_dns_support        = module.vpc.template.enable_dns_support
    enable_dns_hostnames      = module.vpc.template.enable_dns_hostnames
    enable_classiclink        = module.vpc.template.enable_classiclink
    main_route_table_id       = module.vpc.template.main_route_table_id
    default_network_acl_id    = module.vpc.template.default_network_acl_id
    default_security_group_id = module.vpc.template.default_security_group_id
    default_route_table_id    = module.vpc.template.main_route_table_id
    ipv6_association_id       = module.vpc.template.ipv6_association_id
    ipv6_cidr_block           = module.vpc.template.ipv6_cidr_block
    owner_id                  = module.vpc.template.owner_id
    tags_all                  = module.vpc.template.tags_all
  }
}

output "internet_gateway" {
  value = {
    id       = module.internet_gateway.template.id
    arn      = module.internet_gateway.template.arn
    owner_id = module.internet_gateway.template.owner_id
    tags_all = module.internet_gateway.template.tags_all
  }
}

output "public_subnet_a" {
  value = {
    id                             = module.public_subnet_a.template.id,
    arn                            = module.public_subnet_a.template.arn,
    ipv6_cidr_block_association_id = module.public_subnet_a.template.ipv6_cidr_block_association_id
    owner_id                       = module.public_subnet_a.template.owner_id
    tags_all                       = module.public_subnet_a.template.tags_all
  }
}

output "public_subnet_c" {
  value = {
    id                             = module.public_subnet_c.template.id,
    arn                            = module.public_subnet_c.template.arn,
    ipv6_cidr_block_association_id = module.public_subnet_c.template.ipv6_cidr_block_association_id
    owner_id                       = module.public_subnet_c.template.owner_id
    tags_all                       = module.public_subnet_c.template.tags_all
  }
}

output "private_subnet_a" {
  value = {
    id                             = module.private_subnet_a.template.id,
    arn                            = module.private_subnet_a.template.arn,
    ipv6_cidr_block_association_id = module.private_subnet_a.template.ipv6_cidr_block_association_id
    owner_id                       = module.private_subnet_a.template.owner_id
    tags_all                       = module.private_subnet_a.template.tags_all
  }
}

output "private_subnet_c" {
  value = {
    id                             = module.private_subnet_c.template.id,
    arn                            = module.private_subnet_c.template.arn,
    ipv6_cidr_block_association_id = module.private_subnet_c.template.ipv6_cidr_block_association_id
    owner_id                       = module.private_subnet_c.template.owner_id
    tags_all                       = module.private_subnet_c.template.tags_all
  }
}

output "nat_gateway_a_eip" {
  value = {
    allocation_id     = module.nat_gateway_a_eip.template.allocation_id
    association_id    = module.nat_gateway_a_eip.template.association_id
    carrier_ip        = module.nat_gateway_a_eip.template.allocation_id
    customer_owned_ip = module.nat_gateway_a_eip.template.customer_owned_ip
    domain            = module.nat_gateway_a_eip.template.domain
    id                = module.nat_gateway_a_eip.template.id
    private_dns       = module.nat_gateway_a_eip.template.private_dns
    private_ip        = module.nat_gateway_a_eip.template.private_ip
    public_dns        = module.nat_gateway_a_eip.template.public_dns
    public_ip         = module.nat_gateway_a_eip.template.public_ip
    tags_all          = module.nat_gateway_a_eip.template.tags_all
  }
}

output "nat_gateway_c_eip" {
  value = {
    allocation_id     = module.nat_gateway_c_eip.template.allocation_id
    association_id    = module.nat_gateway_c_eip.template.association_id
    carrier_ip        = module.nat_gateway_c_eip.template.allocation_id
    customer_owned_ip = module.nat_gateway_c_eip.template.customer_owned_ip
    domain            = module.nat_gateway_c_eip.template.domain
    id                = module.nat_gateway_c_eip.template.id
    private_dns       = module.nat_gateway_c_eip.template.private_dns
    private_ip        = module.nat_gateway_c_eip.template.private_ip
    public_dns        = module.nat_gateway_c_eip.template.public_dns
    public_ip         = module.nat_gateway_c_eip.template.public_ip
    tags_all          = module.nat_gateway_c_eip.template.tags_all
  }
}

output "nat_gateway_a" {
  value = {
    id                   = module.nat_gateway_a.template.id
    allocation_id        = module.nat_gateway_a.template.allocation_id
    subnet_id            = module.nat_gateway_a.template.subnet_id
    network_interface_id = module.nat_gateway_a.template.network_interface_id
    private_ip           = module.nat_gateway_a.template.private_ip
    public_ip            = module.nat_gateway_a.template.public_ip
    tags_all             = module.nat_gateway_a.template.tags_all
  }
}

output "nat_gateway_c" {
  value = {
    id                   = module.nat_gateway_c.template.id
    allocation_id        = module.nat_gateway_c.template.allocation_id
    subnet_id            = module.nat_gateway_c.template.subnet_id
    network_interface_id = module.nat_gateway_c.template.network_interface_id
    private_ip           = module.nat_gateway_c.template.private_ip
    public_ip            = module.nat_gateway_c.template.public_ip
    tags_all             = module.nat_gateway_c.template.tags_all
  }
}

output "public_route_table" {
  value = {
    id       = module.public_route_table.template.id
    owner_id = module.public_route_table.template.owner_id
    tags_all = module.public_route_table.template.tags_all
  }
}

output "public_subnet_a_route_table_association" {
  value = {
    id = module.public_subnet_a_route_table_association.template.id
  }
}

output "public_subnet_c_route_table_association" {
  value = {
    id = module.public_subnet_c_route_table_association.template.id
  }
}

output "private_a_route_table" {
  value = {
    id       = module.private_a_route_table.template.id
    owner_id = module.private_a_route_table.template.owner_id
    tags_all = module.private_a_route_table.template.tags_all
  }
}

output "private_subnet_a_route_table_association" {
  value = {
    id = module.private_subnet_a_route_table_association.template.id
  }
}

output "private_c_route_table" {
  value = {
    id       = module.private_c_route_table.template.id
    owner_id = module.private_c_route_table.template.owner_id
    tags_all = module.private_c_route_table.template.tags_all
  }
}

output "private_subnet_c_route_table_association" {
  value = {
    id = module.private_subnet_c_route_table_association.template.id
  }
}