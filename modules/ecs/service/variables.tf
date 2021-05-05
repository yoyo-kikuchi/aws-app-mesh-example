variable "name" {
  description = "(Required) Name of the service (up to 255 letters, numbers, hyphens, and underscores)"
  type        = string
}

variable "cluster" {
  description = "(Optional) ARN of an ECS cluster"
  type        = string
}

variable "deployment_maximum_percent" {
  description = "Optional) Upper limit (as a percentage of the service's desiredCount) of the number of running tasks that can be running in a service during a deployment. "
  type        = number
  default     = 200
}

variable "deployment_minimum_healthy_percent" {
  description = "(Optional) Lower limit (as a percentage of the service's desiredCount) of the number of running tasks that must remain running and healthy in a service during a deployment."
  type        = number
  default     = 100
}

variable "desired_count" {
  description = "(Optional) Number of instances of the task definition to place and keep running."
  type        = number
  default     = 1
}

variable "launch_type" {
  description = "(Optional) Launch type on which to run your service."
  type        = string
  default     = "FARGATE"
}

variable "registry_arn" {
  description = "(Required) ARN of the Service Registry."
  type        = string
  default     = null
}

variable "assign_public_ip" {
  description = "(Optional) Assign a public IP address to the ENI (Fargate launch type only). Valid values are true or false."
  type        = bool
  default     = false
}

variable "security_groups" {
  description = "(Optional) Security groups associated with the task or service. "
  type        = list(string)
  default     = []
}

variable "subnets" {
  description = "(Required) Subnets associated with the task or service."
  type        = list(string)
  default     = []
}

variable "load_balancer" {
  type    = bool
  default = false
}

variable "load_balancer_target_group_arn" {
  description = "(Required for ALB/NLB) ARN of the Load Balancer target group to associate with the service."
  type        = string
  default     = null
}

variable "load_balancer_container_name" {
  description = "Required) Name of the container to associate with the load balancer (as it appears in a container definition)."
  type        = string
  default     = null
}

variable "load_balancer_container_port" {
  description = "(Required) Port on the container to associate with the load balancer."
  type        = number
  default     = null
}

variable "task_definition" {
  description = "(Optional) Family and revision (family:revision) or full ARN of the task definition that you want to run in your service. "
  type        = string
}

variable "enable_execute_command" {
  description = "(Optional) Specifies whether to enable Amazon ECS Exec for the tasks within the service."
  type        = bool
  default     = true
}