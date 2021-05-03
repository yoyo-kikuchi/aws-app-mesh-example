variable "name" {
  description = "(Required) The name to use for the service mesh."
  type        = string
}

variable "setting_name" {
  description = "(Required) Name of the setting to manage."
  type        = string
  default     = "containerInsights"
}

variable "setting_value" {
  description = "(Required) The value to assign to the setting. "
  type        = string
  default     = "enabled"
}
