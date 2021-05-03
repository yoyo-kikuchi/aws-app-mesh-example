resource "aws_subnet" "template" {
  vpc_id                  = var.vpc_id
  cidr_block              = var.cidr_block
  map_public_ip_on_launch = var.map_public_ip_on_launch
  availability_zone_id    = var.availability_zone_id
  tags                    = var.tags
}