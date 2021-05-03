output "sample_mesh" {
  value = {
    id           = module.sample_mesh.template.id
    arn          = module.sample_mesh.template.arn
    created_date = module.sample_mesh.template.created_date
    tags_all     = module.sample_mesh.template.tags_all
  }
}