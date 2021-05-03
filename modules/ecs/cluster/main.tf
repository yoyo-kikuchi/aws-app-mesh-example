resource "aws_ecs_cluster" "template" {
  name = var.name

  setting {
    name  = var.setting_name
    value = var.setting_value
  }
}