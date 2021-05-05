output "template" {
  value = {
    id                = aws_appmesh_route.template.id
    arn               = aws_appmesh_route.template.arn
    created_date      = aws_appmesh_route.template.created_date
    last_updated_date = aws_appmesh_route.template.last_updated_date
    tags_all          = aws_appmesh_route.template.tags
  }
}
