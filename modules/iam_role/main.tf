data "template_file" "assume_role_policy" {
  template = var.assume_role_policy
}

resource "aws_iam_role" "template" {
  name                = var.name
  assume_role_policy  = data.template_file.assume_role_policy.rendered
  managed_policy_arns = var.managed_policy_arns
  path                = var.path
  tags                = var.tags
}