variable "vpc_id" {
  description = "(Required) The VPC ID."
  type        = string
}

variable "cidr_block" {
  description = "(Required) The CIDR block of the route."
  type        = string
  default     = "0.0.0.0/0"
}

variable "gateway_id" {
  description = "(Optional) Identifier of a VPC internet gateway or a virtual private gateway."
  type        = string
}

variable "tags" {
  description = "(Optional) A map of tags to assign to the resource"
  type        = map(string)
  default     = {}
}
