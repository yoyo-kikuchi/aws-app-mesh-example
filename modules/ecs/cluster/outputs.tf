output "template" {
  value = {
    id       = aws_ecs_cluster.template.id
    arn      = aws_ecs_cluster.template.arn
    tags_all = aws_ecs_cluster.template.tags
  }
}
