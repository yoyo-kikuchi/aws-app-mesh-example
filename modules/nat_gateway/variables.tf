variable "subnet_id" {
  description = "(Required) The Subnet ID of the subnet in which to place the gateway."
  type        = string
}

variable "allocation_id" {
  description = "(Required) The Allocation ID of the Elastic IP address for the gateway."
  type        = string
}

variable "tags" {
  description = "(Optional) A map of tags to assign to the resource"
  type        = map(string)
  default     = {}
}
