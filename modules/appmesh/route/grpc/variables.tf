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

variable "grpc_route_metadata" {
  description = "(Optional) The data to match from the gRPC request."
  type        = string
  default     = null
}

variable "grpc_route_method_name" {
  description = "(Optional) The method name to match from the request. "
  type        = string
  default     = ""
}

variable "grpc_route_service_name" {
  description = "(Optional) The fully qualified domain name for the service to match from the request."
  type        = string
  default     = null
}

variable "weighted_targets" {
  description = "The virtual node to associate with the weighted target & The relative weight of the weighted target. "
  type = list(object({
    virtual_node = string
    weight       = number
  }))
  default = []
}

