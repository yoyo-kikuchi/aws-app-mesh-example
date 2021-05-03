resource "aws_lb_listener_rule" "template" {
  listener_arn = var.listener_arn
  priority     = var.priority

  action {
    type             = var.action_type
    target_group_arn = var.action_target_group_arn
  }

  condition {
    path_pattern = var.path_pattern
  }

}