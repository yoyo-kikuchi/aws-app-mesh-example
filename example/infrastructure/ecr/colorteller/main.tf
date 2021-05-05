module "colorteller" {
  source       = "../../../../modules/ecr"
  name         = "colorteller"
  scan_on_push = false
}
