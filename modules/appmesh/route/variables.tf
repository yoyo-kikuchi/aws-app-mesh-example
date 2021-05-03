variable "name" {
  description = "(Required) The name to use for the virtual node."
  type        = string
}

variable "mesh_name" {
  description = "(Required) The name of the service mesh in which to create the virtual node."
  type        = string
}

variable "virtual_router_name" {
  description = "(Required) The name of the virtual router in which to create the route."
  type        = string
}

variable "http_route_match_prefix" {
  description = "Optional) The value sent by the client must begin with the specified characters. "
  type        = string
  default     = "/"
}

variable "weighted_targets" {
  description = "The virtual node to associate with the weighted target & The relative weight of the weighted target. "
  type = list(object({
    virtual_node = string
    weight       = number
  }))
  default = []
}

