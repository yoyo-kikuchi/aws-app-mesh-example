output "server" {
  value = {
    arn            = module.server.template.arn
    registry_id    = module.server.template.registry_id
    repository_url = module.server.template.repository_url
    tags_all       = module.server.template.tags_all
  }
}