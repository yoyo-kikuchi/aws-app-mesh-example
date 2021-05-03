variable "name" {
  description = "(Required) The name to use for the virtual node."
  type        = string
}

variable "mesh_name" {
  description = "(Required) The name of the service mesh in which to create the virtual node."
  type        = string
}

variable "is_backend" {
  description = "(Optional) The backends to which the virtual node is expected to send outbound traffic."
  type        = bool
  default     = false
}

variable "is_health_check" {
  type    = bool
  default = false
}
variable "virtual_service" {
  description = "(Required) Specifies a virtual service to use as a backend for a virtual node."
  type        = list(string)
  default     = []
}

variable "listener_port" {
  description = "(Required) The port used for the port mapping."
  type        = number
  default     = 9080
}

variable "listener_protocol" {
  description = "(Required) The protocol used for the port mapping."
  type        = string
  default     = "http"
}

variable "health_check_protocol" {
  description = "(Required) The protocol for the health check request."
  type        = string
  default     = "http"
}

variable "health_check_path" {
  description = "(Optional) The destination path for the health check request. "
  type        = string
  default     = "/ping"
}

variable "health_check_healthy_threshold" {
  description = "(Required) The number of consecutive successful health checks that must occur before declaring listener healthy."
  type        = number
  default     = 2
}

variable "health_check_unhealthy_threshold" {
  description = "(Required) The number of consecutive failed health checks that must occur before declaring a virtual node unhealthy."
  type        = number
  default     = 2
}

variable "health_check_timeout" {
  description = "(Required) The amount of time to wait when receiving a response from the health check, in milliseconds."
  type        = number
  default     = 2000
}

variable "health_check_interval" {
  description = "(Required) The time period in milliseconds between each health check execution."
  type        = number
  default     = 5000
}

variable "service_discovery_dns_hostname" {
  description = "(Optional) Specifies the DNS service name for the virtual node."
  type        = string
}

