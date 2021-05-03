resource "aws_lb_target_group" "template" {
  name                 = var.name
  port                 = var.port
  protocol             = var.protocol
  target_type          = var.target_type
  vpc_id               = var.vpc_id
  proxy_protocol_v2    = var.proxy_protocol_v2
  deregistration_delay = var.deregistration_delay

  health_check {
    unhealthy_threshold = var.health_check_unhealthy_threshold
    healthy_threshold   = var.health_check_healthy_threshold
    interval            = var.health_check_interval
    path                = var.health_check_path
    protocol            = var.health_check_protocol
    timeout             = var.health_check_timeout
  }
}