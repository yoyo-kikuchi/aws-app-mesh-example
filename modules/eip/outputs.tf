output "template" {
  value = {
    allocation_id     = aws_eip.template.allocation_id
    association_id    = aws_eip.template.association_id
    carrier_ip        = aws_eip.template.allocation_id
    customer_owned_ip = aws_eip.template.customer_owned_ip
    domain            = aws_eip.template.domain
    id                = aws_eip.template.id
    private_dns       = aws_eip.template.private_dns
    private_ip        = aws_eip.template.private_ip
    public_dns        = aws_eip.template.public_dns
    public_ip         = aws_eip.template.public_ip
    tags_all          = aws_eip.template.tags
  }
}
