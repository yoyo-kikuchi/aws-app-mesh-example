output "template" {
  value = {
    id       = aws_security_group.template.id
    arn      = aws_security_group.template.arn
    owner_id = aws_security_group.template.owner_id
    tags_all = aws_security_group.template.tags
  }
}
