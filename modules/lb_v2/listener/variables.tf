variable "load_balancer_arn" {
  description = "(Required, Forces New Resource) ARN of the load balancer."
  type        = string
}

variable "port" {
  description = "(Optional) Port on which the load balancer is listening."
  type        = numbers
  default     = 80
}

variable "protocol" {
  description = "(Optional) Protocol for connections from clients to the load balancer. "
  type        = string
  default     = "HTTP"
}

variable "ssl_policy" {
  description = "(Optional) Name of the SSL Policy for the listener. "
  type        = string
  default     = null
}

variable "certificate_arn" {
  description = "(Optional) ARN of the default SSL server certificate."
  type        = string
  default     = null
}

variable "default_action_type" {
  description = "(Required) Type of routing action. "
  type        = string
  default     = "forward"
}

variable "default_action_target_group_arn" {
  description = "(Optional) ARN of the Target Group to which to route traffic."
  type        = string
}