resource "aws_ecs_task_definition" "template" {
  family                   = var.family
  network_mode             = var.networkMode
  cpu                      = var.cpu
  memory                   = var.memory
  task_role_arn            = var.task_role_arn
  execution_role_arn       = var.execution_role_arn
  requires_compatibilities = var.requires_compatibilities
  container_definitions    = var.container_definitions

  dynamic "proxy_configuration" {
    for_each = var.is_proxy_configuration ? [""] : []
    content {
      container_name = var.proxy_configuration_container_name
      type           = var.proxy_configuration_type
      properties = {
        AppPorts         = var.proxy_app_port
        EgressIgnoredIPs = var.egress_ignored_ips
        IgnoredUID       = var.ignored_uid
        ProxyEgressPort  = var.proxy_egress_port
        ProxyIngressPort = var.proxy_ingress_port
      }
    }
  }
  //  proxy_configuration {
  //    container_name = var.proxy_configuration_container_name
  //    type           = var.proxy_configuration_type
  //    properties = {
  //      AppPorts         = var.proxy_app_port
  //      EgressIgnoredIPs = var.egress_ignored_ips
  //      IgnoredUID       = var.ignored_uid
  //      ProxyEgressPort  = var.proxy_egress_port
  //      ProxyIngressPort = var.proxy_ingress_port
  //    }
  //  }
}
