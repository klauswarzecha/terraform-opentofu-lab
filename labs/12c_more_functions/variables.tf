variable "aws_region" {
  description = "The AWS region for the lab."
  type        = string
  default     = "eu-central-1"
}

# type = list(any) is NOT valid!
# all lists elements must have the same type
# this is not Python :(
variable "nested" {
  description = "A nested list of integers."
  type        = any
  default = [
    1, 2, 3, 4,
    [77, 212, 42, 19],
    [[33, 44, 55], [5, 6, 7, ]]
  ]
}

variable "sloppy_fruits" {
  description = "A sloppy list of fruits with leading and trailing spaces."
  type        = list(string)
  default = [
    " apple ",
    " pear ",
    " peach",
    "   cherry  ",
    "  pineapple ",
    "    banana ",
  ]
}
