output "template" {
  value = {
    arn      = aws_cloudwatch_log_group.template.arn
    tags_all = aws_cloudwatch_log_group.template.tags
  }
}
