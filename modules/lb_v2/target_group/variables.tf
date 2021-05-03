variable "name" {
  description = "(Optional, Forces new resource) Name of the target group."
  type        = string
}

variable "port" {
  description = "(May be required, Forces new resource) Port on which targets receive traffic, unless overridden when registering a specific target. "
  type        = string
}

variable "protocol" {
  description = "(May be required, Forces new resource) Protocol to use for routing traffic to the targets. "
  type        = string
  default     = "HTTP"
}

variable "target_type" {
  description = "(May be required, Forces new resource) Type of target that you must specify when registering targets with this target group."
  type        = string
  default     = "ip"
}

variable "vpc_id" {
  description = "(Optional, Forces new resource) Identifier of the VPC in which to create the target group. "
  type        = string
}

variable "proxy_protocol_v2" {
  description = "(Optional) Whether to enable support for proxy protocol v2 on Network Load Balancers."
  type        = bool
  default     = false
}

variable "deregistration_delay" {
  description = "(Optional) Amount time for Elastic Load Balancing to wait before changing the state of a deregistering target from draining to unused."
  type        = number
  default     = 120
}

variable "health_check_unhealthy_threshold" {
  description = "(Optional) Number of consecutive health check failures required before considering the target unhealthy."
  type        = number
  default     = 2
}

variable "health_check_healthy_threshold" {
  description = "Optional) Number of consecutive health checks successes required before considering an unhealthy target healthy."
  type        = number
  default     = 2
}

variable "health_check_interval" {
  description = "(Optional) Approximate amount of time, in seconds, between health checks of an individual target. Minimum value 5 seconds, Maximum value 300 seconds."
  type        = number
  default     = 6
}

variable "health_check_path" {
  description = "(May be required) Destination for the health check request. Required for HTTP/HTTPS ALB and HTTP NLB. "
  type        = string
}

variable "health_check_protocol" {
  description = "(Optional) Protocol to use to connect with the target. "
  type        = string
  default     = "HTTO"
}

variable "health_check_timeout" {
  description = "(Optional) Amount of time, in seconds, during which no response means a failed health check. "
  type        = number
  default     = 5
}