output "colorteller" {
  value = {
    arn            = module.colorteller.template.arn
    registry_id    = module.colorteller.template.registry_id
    repository_url = module.colorteller.template.repository_url
    tags_all       = module.colorteller.template.tags_all
  }
}