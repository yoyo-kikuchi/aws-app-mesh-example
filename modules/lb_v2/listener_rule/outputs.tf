output "template" {
  value = {
    id  = aws_lb_listener_rule.template.id
    arn = aws_lb_listener_rule.template.arn
  }
}

