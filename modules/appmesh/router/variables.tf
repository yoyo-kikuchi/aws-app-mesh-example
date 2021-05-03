variable "name" {
  description = "(Required) The name to use for the virtual router. "
  type        = string
}

variable "mesh_name" {
  description = "(Required) The name of the service mesh in which to create the virtual node."
  type        = string
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

