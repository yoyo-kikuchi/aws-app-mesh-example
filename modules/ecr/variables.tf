variable "name" {
  description = "(Required) Name of the repository."
  type        = string
}

variable "image_tag_mutability" {
  description = "(Optional) The tag mutability setting for the repository."
  type        = string
  default     = "MUTABLE"
}

variable "scan_on_push" {
  description = "Required) Indicates whether images are scanned after being pushed to the repository (true) or not scanned (false)."
  type        = bool
  default     = true
}