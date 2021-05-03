output "template" {
  value = {
    cluster       = aws_ecs_service.template.cluster
    desired_count = aws_ecs_service.template.desired_count
    iam_role      = aws_ecs_service.template.iam_role
    id            = aws_ecs_service.template.id
    name          = aws_ecs_service.template.name
    tags_all      = aws_ecs_service.template.tags
  }
}
