variable "listener_arn" {
  description = "(Required, Forces New Resource) The ARN of the listener to which to attach the rule."
  type        = string
}

variable "priority" {
  description = "Optional) The priority for the rule between 1 and 50000."
  type        = number
  default     = 1
}

variable "action_type" {
  description = "(Required) The type of routing action."
  type        = string
  default     = "forward"
}

variable "action_target_group_arn" {
  description = "(Optional) The ARN of the Target Group to which to route traffic."
  type        = string
}

variable "path_pattern" {
  description = "(Optional) Contains a single values item which is a list of path patterns to match against the request URL."
  type        = list(string)
  default     = ["*"]
}