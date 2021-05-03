resource "aws_route_table" "template" {
  vpc_id = var.vpc_id

  route {
    cidr_block     = var.cidr_block
    nat_gateway_id = var.nat_gateway_id
  }

  tags = var.tags
}