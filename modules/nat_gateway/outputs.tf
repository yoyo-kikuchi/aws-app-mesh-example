output "template" {
  value = {
    id                   = aws_nat_gateway.template.id
    allocation_id        = aws_nat_gateway.template.allocation_id
    subnet_id            = aws_nat_gateway.template.subnet_id
    network_interface_id = aws_nat_gateway.template.network_interface_id
    private_ip           = aws_nat_gateway.template.private_ip
    public_ip            = aws_nat_gateway.template.public_ip
    tags_all             = aws_nat_gateway.template.tags
  }
}

