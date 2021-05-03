output "template" {
  value = {
    arn                       = aws_vpc.template.arn,
    id                        = aws_vpc.template.id,
    cidr_block                = aws_vpc.template.cidr_block,
    instance_tenancy          = aws_vpc.template.instance_tenancy
    enable_dns_support        = aws_vpc.template.enable_dns_support
    enable_dns_hostnames      = aws_vpc.template.enable_dns_hostnames
    enable_classiclink        = aws_vpc.template.enable_classiclink
    main_route_table_id       = aws_vpc.template.main_route_table_id
    default_network_acl_id    = aws_vpc.template.default_network_acl_id
    default_security_group_id = aws_vpc.template.default_security_group_id
    default_route_table_id    = aws_vpc.template.main_route_table_id
    ipv6_association_id       = aws_vpc.template.ipv6_association_id
    ipv6_cidr_block           = aws_vpc.template.ipv6_cidr_block
    owner_id                  = aws_vpc.template.owner_id
    tags_all                  = aws_vpc.template.tags
  }
}