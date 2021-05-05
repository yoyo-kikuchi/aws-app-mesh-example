output "template" {
  value = {
    arn      = aws_ecs_task_definition.template.arn
    revision = aws_ecs_task_definition.template.revision
    tags_all = aws_ecs_task_definition.template.tags
  }
}
