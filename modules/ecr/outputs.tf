output "template" {
  value = {
    arn            = aws_ecr_repository.template.arn
    registry_id    = aws_ecr_repository.template.registry_id
    repository_url = aws_ecr_repository.template.repository_url
    tags_all       = aws_ecr_repository.template.tags
  }
}