output "template" {
  value = {
    id                = aws_appmesh_virtual_node.template.id
    arn               = aws_appmesh_virtual_node.template.arn
    created_date      = aws_appmesh_virtual_node.template.created_date
    last_updated_date = aws_appmesh_virtual_node.template.last_updated_date
    tags_all          = aws_appmesh_virtual_node.template.tags
  }
}
