variable "names" {
  description = "A list of first names used as mnemonics in stories about cryptography."
  type        = list(string)
  default = [
    "alice", "bob", "carol", "dave", "eve", "faythe", "grace", "heidi", "ivan", "mallory", "bob", "alice"
  ]
  # duplicates added on purpose
}

variable "ports" {
  description = "A tuple of well-known ports."
  type        = tuple([number, number, number])
  default     = [22, 80, 443]
}

variable "labels" {
  description = "A map of labels."
  type        = map(string)
  default = {
    env   = "lab"
    owner = "terraform"
    team  = "platform"
  }
}

variable "base_cidr" {
  description = "Base CIDR block for subnet calculations."
  type        = string
  default     = "10.120.0.0/16"
}