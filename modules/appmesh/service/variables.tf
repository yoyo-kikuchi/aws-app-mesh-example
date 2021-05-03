variable "name" {
  description = "(Required) The name to use for the virtual router. "
  type        = string
}

variable "mesh_name" {
  description = "(Required) The name of the service mesh in which to create the virtual node."
  type        = string
}

variable "is_virtual_router" {
  type    = bool
  default = false
}

variable "is_virtual_node" {
  type    = bool
  default = false
}

variable "virtual_router_name" {
  description = "(Optional) The virtual node associated with a virtual service."
  type        = string
  default     = ""
}

variable "virtual_node_name" {
  description = "(Optional) The virtual router associated with a virtual service."
  type        = string
  default     = ""
}
