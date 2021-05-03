output "template" {
  value = {
    id          = aws_service_discovery_private_dns_namespace.template.id
    arn         = aws_service_discovery_private_dns_namespace.template.arn
    hosted_zone = aws_service_discovery_private_dns_namespace.template.hosted_zone
    tags_all    = aws_service_discovery_private_dns_namespace.template.tags
  }
}
