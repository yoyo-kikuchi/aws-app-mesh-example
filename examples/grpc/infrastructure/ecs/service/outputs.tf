output "color_client_registry" {
  value = {
    id       = module.color_client_registry.template.id
    arn      = module.color_client_registry.template.arn
    tags_all = module.color_client_registry.template.tags_all
  }
}

output "color_client_service" {
  value = {
    cluster       = module.color_client_service.template.cluster
    desired_count = module.color_client_service.template.desired_count
    iam_role      = module.color_client_service.template.iam_role
    id            = module.color_client_service.template.id
    name          = module.color_client_service.template.name
    tags_all      = module.color_client_service.template.tags_all
  }
}

output "color_server_registry" {
  value = {
    id       = module.color_server_registry.template.id
    arn      = module.color_server_registry.template.arn
    tags_all = module.color_server_registry.template.tags_all
  }
}

output "color_server_service" {
  value = {
    cluster       = module.color_server_service.template.cluster
    desired_count = module.color_server_service.template.desired_count
    iam_role      = module.color_server_service.template.iam_role
    id            = module.color_server_service.template.id
    name          = module.color_server_service.template.name
    tags_all      = module.color_server_service.template.tags_all
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
