output "template" {
  value = {
    id       = aws_internet_gateway.template.id,
    arn      = aws_internet_gateway.template.arn,
    owner_id = aws_internet_gateway.template.owner_id
    tags_all = aws_internet_gateway.template.tags
  }
}