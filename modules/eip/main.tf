resource "aws_eip" "template" {
  vpc = var.vpc
}