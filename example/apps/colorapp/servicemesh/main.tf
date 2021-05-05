data "terraform_remote_state" "appmesh" {
  backend = "s3"
  config = {
    bucket = "development-my-tfstate"
    key    = "appmesh-mesh/terraform.tfstate"
    region = "ap-northeast-1"
  }
}

locals {
  services_domain     = "sample.local"
  virtual_router_name = "colorteller-vr"
  virtual_node_name   = "tcpecho-vn"
}

module "color_black_virtual_node" {
  source                           = "../../../../modules/appmesh/node"
  name                             = "colorteller-black-vn"
  mesh_name                        = data.terraform_remote_state.appmesh.outputs.sample_mesh["id"]
  is_backend                       = false
  is_health_check                  = true
  listener_port                    = "9080"
  listener_protocol                = "http"
  health_check_protocol            = "http"
  health_check_path                = "/ping"
  health_check_healthy_threshold   = "2"
  health_check_unhealthy_threshold = "2"
  health_check_timeout             = "2000"
  health_check_interval            = "5000"
  service_discovery_dns_hostname   = "colorteller-black.${local.services_domain}"
}

module "color_blue_virtual_node" {
  source                           = "../../../../modules/appmesh/node"
  name                             = "colorteller-blue-vn"
  mesh_name                        = data.terraform_remote_state.appmesh.outputs.sample_mesh["id"]
  is_backend                       = false
  is_health_check                  = true
  listener_port                    = "9080"
  listener_protocol                = "http"
  health_check_protocol            = "http"
  health_check_path                = "/ping"
  health_check_healthy_threshold   = "2"
  health_check_unhealthy_threshold = "2"
  health_check_timeout             = "2000"
  health_check_interval            = "5000"
  service_discovery_dns_hostname   = "colorteller-blue.${local.services_domain}"
}

module "color_red_virtual_node" {
  source                           = "../../../../modules/appmesh/node"
  name                             = "colorteller-red-vn"
  mesh_name                        = data.terraform_remote_state.appmesh.outputs.sample_mesh["id"]
  is_backend                       = false
  is_health_check                  = true
  listener_port                    = "9080"
  listener_protocol                = "http"
  health_check_protocol            = "http"
  health_check_path                = "/ping"
  health_check_healthy_threshold   = "2"
  health_check_unhealthy_threshold = "2"
  health_check_timeout             = "2000"
  health_check_interval            = "5000"
  service_discovery_dns_hostname   = "colorteller-red.${local.services_domain}"
}

module "color_white_virtual_node" {
  source                           = "../../../../modules/appmesh/node"
  name                             = "colorteller-white-vn"
  mesh_name                        = data.terraform_remote_state.appmesh.outputs.sample_mesh["id"]
  is_backend                       = false
  is_health_check                  = true
  listener_port                    = "9080"
  listener_protocol                = "http"
  health_check_protocol            = "http"
  health_check_path                = "/ping"
  health_check_healthy_threshold   = "2"
  health_check_unhealthy_threshold = "2"
  health_check_timeout             = "2000"
  health_check_interval            = "5000"
  service_discovery_dns_hostname   = "colorteller-white.${local.services_domain}"
}

module "color_teller_virtual_router" {
  source            = "../../../../modules/appmesh/router"
  name              = local.virtual_router_name
  mesh_name         = data.terraform_remote_state.appmesh.outputs.sample_mesh["id"]
  listener_port     = "9080"
  listener_protocol = "http"
}

module "color_teller_route" {
  source                  = "../../../../modules/appmesh/route"
  name                    = "colorteller-route"
  mesh_name               = data.terraform_remote_state.appmesh.outputs.sample_mesh["id"]
  virtual_router_name     = local.virtual_router_name
  http_route_match_prefix = "/"
  weighted_targets = [
    { virtual_node : "colorteller-white-vn", weight : 1 },
    { virtual_node : "colorteller-blue-vn", weight : 1 },
    { virtual_node : "colorteller-red-vn", weight : 1 },
  ]
  depends_on = [
    module.tcp_echo_virtual_node,
    module.color_blue_virtual_node,
    module.color_red_virtual_node,
    module.color_white_virtual_node
  ]
}

module "color_teller_virtual_service" {
  source              = "../../../../modules/appmesh/service"
  name                = "colorteller.${local.services_domain}"
  mesh_name           = data.terraform_remote_state.appmesh.outputs.sample_mesh["id"]
  virtual_router_name = local.virtual_router_name
  is_virtual_router   = true
}

module "tcp_echo_virtual_node" {
  source                           = "../../../../modules/appmesh/node"
  name                             = local.virtual_node_name
  mesh_name                        = data.terraform_remote_state.appmesh.outputs.sample_mesh["id"]
  is_backend                       = false
  is_health_check                  = true
  listener_port                    = "2701"
  listener_protocol                = "tcp"
  health_check_protocol            = "tcp"
  health_check_path                = null
  health_check_healthy_threshold   = "2"
  health_check_unhealthy_threshold = "2"
  health_check_timeout             = "2000"
  health_check_interval            = "5000"
  service_discovery_dns_hostname   = "tcpecho.${local.services_domain}"
}

module "tcp_echo_virtual_service" {
  source            = "../../../../modules/appmesh/service"
  name              = "tcpecho.${local.services_domain}"
  mesh_name         = data.terraform_remote_state.appmesh.outputs.sample_mesh["id"]
  virtual_node_name = local.virtual_node_name
  is_virtual_node   = true
  depends_on = [
    module.tcp_echo_virtual_node
  ]
}

module "color_gateway_virtual_node" {
  source                         = "../../../../modules/appmesh/node"
  name                           = "colorgateway-vn"
  mesh_name                      = data.terraform_remote_state.appmesh.outputs.sample_mesh["id"]
  is_backend                     = true
  is_health_check                = false
  listener_port                  = "9080"
  listener_protocol              = "http"
  service_discovery_dns_hostname = "colorgateway.${local.services_domain}"
  virtual_service = [
    "colorteller.${local.services_domain}",
    "tcpecho.${local.services_domain}"
  ]
}