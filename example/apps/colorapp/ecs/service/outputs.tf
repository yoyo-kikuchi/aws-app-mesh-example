output "white_service_discovery_record" {
  value = {
    id       = module.white_service_discovery_record.template.id
    arn      = module.white_service_discovery_record.template.arn
    tags_all = module.white_service_discovery_record.template.tags_all
  }
}

output "ecs_service_white" {
  value = {
    cluster       = module.ecs_service_white.template.cluster
    desired_count = module.ecs_service_white.template.desired_count
    iam_role      = module.ecs_service_white.template.iam_role
    id            = module.ecs_service_white.template.id
    name          = module.ecs_service_white.template.name
    tags_all      = module.ecs_service_white.template.tags_all
  }
}

output "blue_service_discovery_record" {
  value = {
    id       = module.blue_service_discovery_record.template.id
    arn      = module.blue_service_discovery_record.template.arn
    tags_all = module.blue_service_discovery_record.template.tags_all
  }
}

output "ecs_service_blue" {
  value = {
    cluster       = module.ecs_service_blue.template.cluster
    desired_count = module.ecs_service_blue.template.desired_count
    iam_role      = module.ecs_service_blue.template.iam_role
    id            = module.ecs_service_blue.template.id
    name          = module.ecs_service_blue.template.name
    tags_all      = module.ecs_service_blue.template.tags_all
  }
}

output "red_service_discovery_record" {
  value = {
    id       = module.red_service_discovery_record.template.id
    arn      = module.red_service_discovery_record.template.arn
    tags_all = module.red_service_discovery_record.template.tags_all
  }
}

output "ecs_service_red" {
  value = {
    cluster       = module.ecs_service_red.template.cluster
    desired_count = module.ecs_service_red.template.desired_count
    iam_role      = module.ecs_service_red.template.iam_role
    id            = module.ecs_service_red.template.id
    name          = module.ecs_service_red.template.name
    tags_all      = module.ecs_service_red.template.tags_all
  }
}

output "black_service_discovery_record" {
  value = {
    id       = module.black_service_discovery_record.template.id
    arn      = module.black_service_discovery_record.template.arn
    tags_all = module.black_service_discovery_record.template.tags_all
  }
}

output "ecs_service_black" {
  value = {
    cluster       = module.ecs_service_black.template.cluster
    desired_count = module.ecs_service_black.template.desired_count
    iam_role      = module.ecs_service_black.template.iam_role
    id            = module.ecs_service_black.template.id
    name          = module.ecs_service_black.template.name
    tags_all      = module.ecs_service_black.template.tags_all
  }
}

output "gateway_service_discovery_record" {
  value = {
    id       = module.gateway_service_discovery_record.template.id
    arn      = module.gateway_service_discovery_record.template.arn
    tags_all = module.gateway_service_discovery_record.template.tags_all
  }
}

output "ecs_service_gateway" {
  value = {
    cluster       = module.ecs_service_gateway.template.cluster
    desired_count = module.ecs_service_gateway.template.desired_count
    iam_role      = module.ecs_service_gateway.template.iam_role
    id            = module.ecs_service_gateway.template.id
    name          = module.ecs_service_gateway.template.name
    tags_all      = module.ecs_service_gateway.template.tags_all
  }
}

output "echo_service_discovery_record" {
  value = {
    id       = module.gateway_service_discovery_record.template.id
    arn      = module.gateway_service_discovery_record.template.arn
    tags_all = module.gateway_service_discovery_record.template.tags_all
  }
}

output "ecs_service_echo" {
  value = {
    cluster       = module.ecs_service_gateway.template.cluster
    desired_count = module.ecs_service_gateway.template.desired_count
    iam_role      = module.ecs_service_gateway.template.iam_role
    id            = module.ecs_service_gateway.template.id
    name          = module.ecs_service_gateway.template.name
    tags_all      = module.ecs_service_gateway.template.tags_all
  }
}

output "public_alb_sg" {
  value = {
    id       = module.public_alb_sg.template.id
    arn      = module.public_alb_sg.template.arn
    owner_id = module.public_alb_sg.template.owner_id
    tags_all = module.public_alb_sg.template.tags_all
  }
}

output "public_load_balancer" {
  value = {
    id         = module.public_load_balancer.template.id
    arn        = module.public_load_balancer.template.arn
    arn_suffix = module.public_load_balancer.template.arn_suffix
    dns_name   = module.public_load_balancer.template.dns_name
    tags_all   = module.public_load_balancer.template.tags_all
    zone_id    = module.public_load_balancer.template.zone_id
  }
}

output "target_group" {
  value = {
    id         = module.target_group.template.id
    arn        = module.target_group.template.arn
    arn_suffix = module.target_group.template.arn_suffix
    tags_all   = module.target_group.template.tags_all
    name       = module.target_group.template.name
  }
}

output "alb_listener" {
  value = {
    id  = module.alb_listener.template.id
    arn = module.alb_listener.template.arn
  }
}

output "load_balancer_rule" {
  value = {
    id  = module.load_balancer_rule.template.id
    arn = module.load_balancer_rule.template.arn
  }
}
