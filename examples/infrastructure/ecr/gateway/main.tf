module "gateway" {
  source       = "../../../../modules/ecr"
  name         = "gateway"
  scan_on_push = false
}