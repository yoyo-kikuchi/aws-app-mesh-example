resource "aws_appmesh_virtual_router" "template" {
  name      = var.name
  mesh_name = var.mesh_name

  spec {
    listener {
      port_mapping {
        port     = var.listener_port
        protocol = var.listener_protocol
      }
    }
  }
}