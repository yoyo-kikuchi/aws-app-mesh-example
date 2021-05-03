variable "vpc_id" {
  description = "Required) The VPC ID to create in"
  type        = string
}

variable "tags" {
  description = "(Optional) A map of tags to assign to the resource"
  type        = map(string)
  default     = {}
}