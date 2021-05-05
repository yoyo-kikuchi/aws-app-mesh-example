output "ecs_task_white" {
  value = {
    arn      = module.ecs_task_white.template.arn
    revision = module.ecs_task_white.template.revision
    tags_all = module.ecs_task_white.template.tags_all
  }
}

output "ecs_task_blue" {
  value = {
    arn      = module.ecs_task_blue.template.arn
    revision = module.ecs_task_blue.template.revision
    tags_all = module.ecs_task_blue.template.tags_all
  }
}

output "ecs_task_red" {
  value = {
    arn      = module.ecs_task_red.template.arn
    revision = module.ecs_task_red.template.revision
    tags_all = module.ecs_task_red.template.tags_all
  }
}

output "ecs_task_black" {
  value = {
    arn      = module.ecs_task_black.template.arn
    revision = module.ecs_task_black.template.revision
    tags_all = module.ecs_task_black.template.tags_all
  }
}

output "ecs_task_gateway" {
  value = {
    arn      = module.ecs_task_gateway.template.arn
    revision = module.ecs_task_gateway.template.revision
    tags_all = module.ecs_task_gateway.template.tags_all
  }
}

output "ecs_task_tcpecho" {
  value = {
    arn      = module.ecs_task_tcpecho.template.arn
    revision = module.ecs_task_tcpecho.template.revision
    tags_all = module.ecs_task_tcpecho.template.tags_all
  }
}

