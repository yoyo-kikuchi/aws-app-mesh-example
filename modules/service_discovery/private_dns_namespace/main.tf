resource "aws_service_discovery_private_dns_namespace" "template" {
  name        = var.name
  description = var.description
  vpc         = var.vpc
  tags        = var.tags
}
