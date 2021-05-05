output "ecs_service_discovery_namespace" {
  value = {
    id          = module.ecs_service_discovery_namespace.template.id
    arn         = module.ecs_service_discovery_namespace.template.arn
    hosted_zone = module.ecs_service_discovery_namespace.template.hosted_zone
    tags_all    = module.ecs_service_discovery_namespace.template.tags_all
  }
}