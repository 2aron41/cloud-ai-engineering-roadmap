resource "random_pet" "lab_identifier" {
  prefix    = var.project_name
  length    = 2
  separator = "-"
}
