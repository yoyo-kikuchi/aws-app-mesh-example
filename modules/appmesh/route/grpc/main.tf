resource "aws_appmesh_route" "template" {
  name                = var.name
  mesh_name           = var.mesh_name
  virtual_router_name = var.virtual_router_name

  spec {
    grpc_route {
      match {
        method_name  = var.grpc_route_method_name
        service_name = var.grpc_route_service_name
      }

      action {
        dynamic "weighted_target" {
          for_each = var.weighted_targets
          content {
            virtual_node = weighted_target.value.virtual_node
            weight       = weighted_target.value.weight
          }
        }
      }
    }
  }
}