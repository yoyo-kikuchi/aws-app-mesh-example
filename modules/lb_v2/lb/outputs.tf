output "template" {
  value = {
    id         = aws_lb.template.id
    arn        = aws_lb.template.arn
    arn_suffix = aws_lb.template.arn_suffix
    dns_name   = aws_lb.template.dns_name
    tags_all   = aws_lb.template.tags
    zone_id    = aws_lb.template.zone_id
  }
}

