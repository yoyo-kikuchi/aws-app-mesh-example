output "template" {
  value = {
    id                = aws_appmesh_virtual_router.template.id
    arn               = aws_appmesh_virtual_router.template.arn
    created_date      = aws_appmesh_virtual_router.template.created_date
    last_updated_date = aws_appmesh_virtual_router.template.last_updated_date
    tags_all          = aws_appmesh_virtual_router.template.tags
  }
}
