variable "name" {
  description = "(Optional, Forces new resource) The name of the log group."
  type        = string
}

variable "retention_in_days" {
  description = "(Optional) Specifies the number of days you want to retain log events in the specified log group."
  type        = number
  default     = 30
}

variable "tags" {
  description = "(Optional) A map of tags to assign to the resource"
  type        = map(string)
  default     = {}
}