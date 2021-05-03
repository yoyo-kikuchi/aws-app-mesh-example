resource "aws_ecs_service" "template" {
  name                               = var.name
  cluster                            = var.cluster
  deployment_maximum_percent         = var.deployment_maximum_percent
  deployment_minimum_healthy_percent = var.deployment_minimum_healthy_percent
  desired_count                      = var.desired_count
  launch_type                        = var.launch_type
  service_registries {
    registry_arn = var.registry_arn
  }
  network_configuration {
    assign_public_ip = var.assign_public_ip
    security_groups  = var.security_groups
    subnets          = var.subnets
  }

  dynamic "load_balancer" {
    for_each = var.load_balancer ? [""] : []
    content {
      target_group_arn = var.load_balancer_target_group_arn
      container_name   = var.load_balancer_container_name
      container_port   = var.load_balancer_container_port
    }
  }

  task_definition = var.task_definition
}