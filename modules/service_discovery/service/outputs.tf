output "template" {
  value = {
    id       = aws_service_discovery_service.template.id
    arn      = aws_service_discovery_service.template.arn
    tags_all = aws_service_discovery_service.template.tags
  }
}
