variable "vpc_id" {
  description = "(Required) The VPC ID to create in"
  type        = string
}

variable "cidr_block" {
  description = "(Required) The CIDR block for the subnet."
  type        = string
}

variable "availability_zone_id" {
  description = "(Optional) The AZ ID of the subnet"
  type        = string
  default     = "ap-northeast-1a"
}

variable "map_public_ip_on_launch" {
  description = "(Optional) Specify true to indicate that instances launched into the subnet should be assigned a public IP address"
  type        = bool
  default     = false
}

variable "tags" {
  description = "(Optional) A map of tags to assign to the resource"
  type        = map(string)
  default     = {}
}