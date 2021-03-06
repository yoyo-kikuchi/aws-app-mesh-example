variable "family" {
  description = "(Required) A unique name for your task definition."
  type        = string
}

variable "networkMode" {
  description = "Optional) Docker networking mode to use for the containers in the task."
  type        = string
  default     = "awsvpc"
}

variable "cpu" {
  description = "The number of cpu units used by the task"
  type        = number
  default     = 256
}

variable "memory" {
  description = "The amount (in MiB) of memory used by the task"
  type        = number
  default     = 512
}

variable "task_role_arn" {
  description = "(Optional) ARN of IAM role that allows your Amazon ECS container task to make calls to other AWS services."
  type        = string
}

variable "execution_role_arn" {
  description = "(Optional) ARN of the task execution role that the Amazon ECS container agent and the Docker daemon can assume."
  type        = string
}

variable "requires_compatibilities" {
  description = "(Optional) Set of launch types required by the task."
  type        = list(string)
  default     = ["FARGATE"]
}

variable "container_definitions" {
  description = "(Required) A list of valid container definitions provided as a single valid JSON document."
  type        = string
}

variable "proxy_configuration_container_name" {
  description = "(Required) Name of the container that will serve as the App Mesh proxy."
  type        = string
  default     = "envoy"
}

variable "proxy_configuration_type" {
  description = "(Optional) Proxy type. The default value is APPMESH"
  type        = string
  default     = "APPMESH"
}

variable "proxy_app_port" {
  type    = string
  default = null
}

variable "egress_ignored_ips" {
  type    = string
  default = null
}

variable "ignored_uid" {
  type    = string
  default = null
}

variable "proxy_egress_port" {
  type    = number
  default = null
}

variable "proxy_ingress_port" {
  type    = number
  default = null
}

variable "is_proxy_configuration" {
  type    = bool
  default = false
}