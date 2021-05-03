resource "aws_nat_gateway" "template" {
  subnet_id     = var.subnet_id
  allocation_id = var.allocation_id
  tags          = var.tags
}