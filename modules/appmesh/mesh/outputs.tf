output "template" {
  value = {
    id           = aws_appmesh_mesh.template.id
    arn          = aws_appmesh_mesh.template.arn
    created_date = aws_appmesh_mesh.template.created_date
    tags_all     = aws_appmesh_mesh.template.tags
  }
}
