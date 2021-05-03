output "template" {
  value = {
    id                             = aws_subnet.template.id,
    arn                            = aws_subnet.template.arn,
    ipv6_cidr_block_association_id = aws_subnet.template.ipv6_cidr_block_association_id
    owner_id                       = aws_subnet.template.owner_id
    tags_all                       = aws_subnet.template.tags
  }
}