output "template" {
  value = {
    id                = aws_appmesh_virtual_service.template.id
    arn               = aws_appmesh_virtual_service.template.arn
    created_date      = aws_appmesh_virtual_service.template.created_date
    last_updated_date = aws_appmesh_virtual_service.template.last_updated_date
    tags_all          = aws_appmesh_virtual_service.template.tags
  }
}
