variable "name" {
  description = "(Optional, Forces new resource) Name of the security group."
  type        = string
}

variable "description" {
  description = "(Optional, Forces new resource) Security group description."
  type        = string
  default     = "Security group for the service"
}

variable "vpc_id" {
  description = "(Optional, Forces new resource) VPC ID"
  type        = string
}

variable "tags" {
  description = "(Optional) A map of tags to assign to the resource"
  type        = map(string)
  default     = {}
}

variable "ingress_description" {
  description = "(Optional) Description of this ingress rule."
  type        = string
  default     = null
}

variable "ingress_from_port" {
  description = "(Required) Start port"
  type        = number
  default     = 0
}

variable "ingress_to_port" {
  description = "(Required) end port"
  type        = number
  default     = 0
}

variable "ingress_protocol" {
  description = "(Required) Protocol. If you select a protocol of -1 (semantically equivalent to all, which is not a valid value here), you must specify a from_port and to_port equal to 0"
  type        = number
  default     = -1
}

variable "ingress_cidr_blocks" {
  description = "(Optional) List of CIDR blocks."
  type        = list(string)
  default     = []
}

variable "egress_from_port" {
  description = "(Required) Start port"
  type        = number
  default     = 0
}

variable "egress_to_port" {
  description = "(Required) end port"
  type        = number
  default     = 0
}

variable "egress_protocol" {
  description = "(Required) Protocol. If you select a protocol of -1 (semantically equivalent to all, which is not a valid value here), you must specify a from_port and to_port equal to 0"
  type        = number
  default     = -1
}

variable "egress_cidr_blocks" {
  description = "(Optional) List of CIDR blocks."
  type        = list(string)
  default     = ["0.0.0.0/0"]
}
