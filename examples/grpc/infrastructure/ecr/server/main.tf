module "server" {
  source       = "../../../../../modules/ecr"
  name         = "grpc_color_server"
  scan_on_push = false
}