resource "aws_internet_gateway" "template" {
  vpc_id = var.vpc_id
  tags   = var.tags
}