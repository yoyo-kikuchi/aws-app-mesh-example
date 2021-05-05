module "client" {
  source       = "../../../../../modules/ecr"
  name         = "grpc_color_client"
  scan_on_push = false
}
