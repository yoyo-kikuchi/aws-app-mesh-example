output "template" {
  value = {
    id         = aws_lb_target_group.template.id
    arn        = aws_lb_target_group.template.arn
    arn_suffix = aws_lb_target_group.template.arn_suffix
    tags_all   = aws_lb_target_group.template.tags
    name       = aws_lb_target_group.template.name
  }
}

