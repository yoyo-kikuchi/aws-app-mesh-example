variable "name" {
  description = "(Optional, Forces new resource) Friendly name of the role. "
  type        = string
  default     = null
}

variable "assume_role_policy" {
  description = "JSON FILE of the assume_role_policy"
  type        = string
}

variable "managed_policy_arns" {
  description = ""
  type        = list(string)
  default     = []
}

variable "path" {
  description = "(Optional) Path to the role. "
  type        = string
  default     = "/"
}

variable "tags" {
  description = "(Optional) A map of tags to assign to the resource"
  type        = map(string)
  default     = {}
}