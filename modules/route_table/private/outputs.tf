output "template" {
  value = {
    id       = aws_route_table.template.id
    owner_id = aws_route_table.template.owner_id
    tags_all = aws_route_table.template.tags
  }
}

