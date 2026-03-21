variable "user_config" {
  description = "Simulated user input map."
  type        = map(any)
  default = {
    name = "example-user"
    # optional fields missing on purpose
  }
}

variable "fallback_name" {
  description = "Name to be used when no other name is given."
  type        = string
  default     = "default-name"
}