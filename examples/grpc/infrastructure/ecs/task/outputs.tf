output "ecs_task_client" {
  value = {
    arn      = module.ecs_task_client.template.arn
    revision = module.ecs_task_client.template.revision
    tags_all = module.ecs_task_client.template.tags_all
  }
}

output "ecs_task_server" {
  value = {
    arn      = module.ecs_task_server.template.arn
    revision = module.ecs_task_server.template.revision
    tags_all = module.ecs_task_server.template.tags_all
  }
}

