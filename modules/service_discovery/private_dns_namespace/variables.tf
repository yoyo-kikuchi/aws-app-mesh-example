variable "name" {
  description = "(Required) The name of the namespace."
  type        = string
}

variable "description" {
  description = "(Optional) The description that you specify for the namespace when you create it."
  type        = string
  default     = null
}

variable "vpc" {
  description = "(Required) The ID of VPC that you want to associate the namespace with."
  type        = string
}

variable "tags" {
  description = "(Optional) A map of tags to assign to the resource"
  type        = map(string)
  default     = {}
}
