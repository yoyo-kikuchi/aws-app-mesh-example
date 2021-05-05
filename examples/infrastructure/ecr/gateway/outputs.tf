output "gateway" {
  value = {
    arn            = module.gateway.template.arn
    registry_id    = module.gateway.template.registry_id
    repository_url = module.gateway.template.repository_url
    tags_all       = module.gateway.template.tags_all
  }
}