data "terraform_remote_state" "appmesh" {
  backend = "s3"
  config = {
    bucket = "development-my-tfstate"
    key    = "appmesh-mesh/terraform.tfstate"
    region = "ap-northeast-1"
  }
}

locals {
  services_domain     = "howto-grpc.local"
  virtual_router_name = "virtual-router"
  virtual_node_name   = "tcpecho-vn"
}

module "grpc_mesh" {
  source = "../../../../modules/appmesh/mesh"
  name   = "howto-grpc"
}

module "color_client_node" {
  source                             = "../../../../modules/appmesh/node"
  name                               = "color_client"
  mesh_name                          = module.grpc_mesh.template.id
  is_backend                         = true
  is_health_check                    = false
  listener_port                      = "8080"
  listener_protocol                  = "http"
  service_discovery_dns_hostname     = "color_server.${local.services_domain}"
  is_service_discovery_aws_cloud_map = true
  aws_cloud_map_namespace_name       = local.services_domain
  aws_cloud_map_service_name         = "color_client"
  virtual_service = [
    "color_server.${local.services_domain}",
  ]
  depends_on = [
    module.grpc_mesh
  ]
}

module "color_server_node" {
  source                             = "../../../../modules/appmesh/node"
  name                               = "color_server"
  mesh_name                          = module.grpc_mesh.template.id
  is_backend                         = false
  is_health_check                    = true
  listener_port                      = "8080"
  listener_protocol                  = "grpc"
  health_check_protocol              = "grpc"
  health_check_healthy_threshold     = "2"
  health_check_unhealthy_threshold   = "3"
  health_check_timeout               = "2000"
  health_check_interval              = "5000"
  is_service_discovery_aws_cloud_map = true
  aws_cloud_map_namespace_name       = local.services_domain
  aws_cloud_map_service_name         = "color_server"
  depends_on = [
    module.grpc_mesh
  ]
}

module "virtual_router" {
  source            = "../../../../modules/appmesh/router"
  name              = local.virtual_router_name
  mesh_name         = module.grpc_mesh.template.id
  listener_port     = "8080"
  listener_protocol = "grpc"
  depends_on = [
    module.grpc_mesh
  ]
}

module "virtual_service" {
  source              = "../../../../modules/appmesh/service"
  name                = "color_server.${local.services_domain}"
  mesh_name           = module.grpc_mesh.template.id
  virtual_router_name = local.virtual_router_name
  is_virtual_router   = true
  depends_on = [
    module.grpc_mesh
  ]
}

module "route" {
  source              = "../../../../modules/appmesh/route/grpc"
  name                = "route"
  mesh_name           = module.grpc_mesh.template.id
  virtual_router_name = local.virtual_router_name
  //  grpc_route_method_name  = "GetColor"
  grpc_route_service_name = "color.ColorService"
  weighted_targets = [
    {
      virtual_node : "color_server",
      weight : 100
    },
  ]
  depends_on = [
    module.grpc_mesh,
    module.virtual_router,
    module.color_server_node
  ]
}

