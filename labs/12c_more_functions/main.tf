
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





}


# loop over lists
locals {
  # strip elements
  stripped_fruits = [
    for fruit in var.sloppy_fruits : trimspace(fruit)
  ]

  # Capitalize the first letter
  title_fruits = [
    for fruit in local.stripped_fruits : title(fruit)
  ]

  # Print the index and the element
  indexed_fruits = [
    for i, fruit in local.stripped_fruits : "${i} - ${fruit}"
  ]

  # list(dict) makes a lot of sense in Python. But this is Terraform!

  # Ceate a map with the index as the key
  numbered_fruits = [
    for i, fruit in local.stripped_fruits : tomap({ "${i}" = "${fruit}" })
  ]

  # Ceate a map with the fruit as the key
  weird_fruits = [
    for i, fruit in local.stripped_fruits : tomap({ "${fruit}" = "${i}" })
  ]
}




# loop over maps
locals {
  fruit_map = {
    for fruit in local.stripped_fruits : fruit => {
      upper  = upper(fruit)
      length = length(fruit)
    }
  }

  numbers_map = {
    for num in local.numbers : num => num * num
  }

  weird_fruits_map = {
    for i, fruit in local.stripped_fruits : fruit => i
  }
}
