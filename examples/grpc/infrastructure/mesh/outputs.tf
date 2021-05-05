output "grpc_mesh" {
  value = {
    id           = module.grpc_mesh.template.id
    arn          = module.grpc_mesh.template.arn
    created_date = module.grpc_mesh.template.created_date
    tags_all     = module.grpc_mesh.template.tags_all
  }
}

output "color_client_node" {
  value = {
    id                = module.color_client_node.template.id
    arn               = module.color_client_node.template.arn
    created_date      = module.color_client_node.template.created_date
    last_updated_date = module.color_client_node.template.last_updated_date
    tags_all          = module.color_client_node.template.tags_all
  }
}

output "color_server_node" {
  value = {
    id                = module.color_server_node.template.id
    arn               = module.color_server_node.template.arn
    created_date      = module.color_server_node.template.created_date
    last_updated_date = module.color_server_node.template.last_updated_date
    tags_all          = module.color_server_node.template.tags_all
  }
}

output "virtual_router" {
  value = {
    id                = module.virtual_router.template.id
    arn               = module.virtual_router.template.arn
    created_date      = module.virtual_router.template.created_date
    last_updated_date = module.virtual_router.template.last_updated_date
    tags_all          = module.virtual_router.template.tags_all
  }
}

output "route" {
  value = {
    id                = module.route.template.id
    arn               = module.route.template.arn
    created_date      = module.route.template.created_date
    last_updated_date = module.route.template.last_updated_date
    tags_all          = module.route.template.tags_all
  }
}

output "virtual_service" {
  value = {
    id                = module.virtual_service.template.id
    arn               = module.virtual_service.template.arn
    created_date      = module.virtual_service.template.created_date
    last_updated_date = module.virtual_service.template.last_updated_date
    tags_all          = module.virtual_service.template.tags_all
  }
}
