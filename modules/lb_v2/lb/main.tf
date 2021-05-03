resource "aws_lb" "template" {
  name                       = var.name
  internal                   = var.internal
  load_balancer_type         = var.load_balancer_type
  security_groups            = var.security_groups
  subnets                    = var.subnets
  enable_deletion_protection = var.enable_deletion_protection

  //  access_logs {
  //    bucket  = var.access_logs_bucket
  //    prefix  = var.access_logs_prefix
  //    enabled = var.access_logs_enabled
  //  }
  tags = var.tags
}