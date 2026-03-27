
resource "random_id" "this" {
  byte_length = 3
}

locals {

  # flatten nested lists
  numbers = distinct(flatten(var.nested))


  # combine two maps/dicts
  combined = merge(
    { Fruit = "cherry" },
    { Numbers = [34, 45, 67] }
  )

  # strip elements
  stripped_fruits = [
    for fruit in var.sloppy_fruits : trimspace(fruit)
  ]

  # Capitalize the first letter
  title_fruits = [
    for fruit in local.stripped_fruits : title(fruit)
  ]


  fruit_map = {
    for fruit in local.stripped_fruits : fruit => {
      upper  = upper(fruit)
      length = length(fruit)
    }
  }


}

