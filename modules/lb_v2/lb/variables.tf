variable "name" {
  description = "Optional) The name of the LB"
  type        = string
}

variable "internal" {
  description = "(Optional) If true, the LB will be internal."
  type        = bool
  default     = true
}

variable "load_balancer_type" {
  description = "(Optional) The type of load balancer to create."
  type        = string
  default     = "application"
}

variable "security_groups" {
  description = "(Optional) A list of security group IDs to assign to the LB."
  type        = list(string)
  default     = []
}

variable "subnets" {
  description = "Optional) A list of subnet IDs to attach to the LB. "
  type        = list(string)
  default     = []
}

variable "enable_deletion_protection" {
  description = "(Optional) If true, deletion of the load balancer will be disabled via the AWS API. "
  type        = bool
  default     = false
}

variable "idle_timeout" {
  description = "Optional) The time in seconds that the connection is allowed to be idle."
  type        = number
  default     = null
}
//variable "access_logs_bucket" {
//  description = "(Required) The S3 bucket name to store the logs in."
//  type        = string
//}
//
//variable "access_logs_prefix" {
//  description = "(Optional) The S3 bucket prefix. Logs are stored in the root if not configured."
//  type        = string
//}
//
//variable "access_logs_enabled" {
//  description = "Optional) Boolean to enable / disable access_logs.s"
//  type        = bool
//  default = true
//}

variable "tags" {
  description = "(Optional) A map of tags to assign to the resource"
  type        = map(string)
  default     = {}
}
