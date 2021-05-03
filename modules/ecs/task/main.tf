resource "aws_ecs_task_definition" "template" {
  family                   = var.family
  networkMode              = var.networkMode
  cpu                      = var.cpu
  memory                   = var.memory
  task_role_arn            = var.task_role_arn
  execution_role_arn       = var.execution_role_arn
  requires_compatibilities = var.requires_compatibilities
  container_definitions    = var.container_definitions

  proxy_configuration {
    container_name = var.proxy_configuration_container_name
    type           = var.proxy_configuration_type
    dynamic "properties" {
      for_each = var.proxy_configuration_properties
      content {
        name  = properties.key
        value = properties.value
      }
    }
  }

}