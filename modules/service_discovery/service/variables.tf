variable "name" {
  description = "(Required, ForceNew) The name of the service."
  type        = string
}

variable "namespace_id" {
  description = "(Optional) The ID of the namespace that you want to use to create the service."
  type        = string
}

variable "dns_records_ttl" {
  description = "(Required) The amount of time, in seconds, that you want DNS resolvers to cache the settings for this resource record set."
  type        = number
  default     = 300
}

variable "dns_records_type" {
  description = "(Required, ForceNew) The type of the resource, which indicates the value that Amazon Route 53 returns in response to DNS queries."
  type        = string
  default     = "A"
}

variable "routing_policy" {
  description = "(Optional) The routing policy that you want to apply to all records that Route 53 creates when you register an instance and specify the service."
  type        = string
  default     = null
}

variable "failure_threshold" {
  description = "Optional) The number of consecutive health checks. Maximum value of 10."
  type        = number
  default     = 1
}
