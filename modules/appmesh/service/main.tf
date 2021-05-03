resource "aws_appmesh_virtual_service" "template" {
  name      = var.name
  mesh_name = var.mesh_name

  spec {
    provider {
      dynamic "virtual_router" {
        for_each = var.is_virtual_router ? [""] : []
        content {
          virtual_router_name = var.virtual_router_name
        }
      }
      dynamic "virtual_node" {
        for_each = var.is_virtual_node ? [""] : []
        content {
          virtual_node_name = var.virtual_node_name
        }
      }
    }
  }
}
