output "template" {
  value = {
    id  = aws_lb_listener.template.id
    arn = aws_lb_listener.template.arn
  }
}

