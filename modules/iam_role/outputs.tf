output "template" {
  value = {
    arn         = aws_iam_role.template.arn
    create_date = aws_iam_role.template.create_date
    id          = aws_iam_role.template.id
    name        = aws_iam_role.template.name
    unique_id   = aws_iam_role.template.unique_id
    tags_all    = aws_iam_role.template.tags
  }
}
