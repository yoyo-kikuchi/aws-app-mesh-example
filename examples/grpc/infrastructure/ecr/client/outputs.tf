output "client" {
  value = {
    arn            = module.client.template.arn
    registry_id    = module.client.template.registry_id
    repository_url = module.client.template.repository_url
    tags_all       = module.client.template.tags_all
  }
}