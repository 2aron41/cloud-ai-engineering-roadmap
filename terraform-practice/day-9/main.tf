terraform {
  required_version = ">= 1.6.0"
}

locals {
  project_name = "cloud-ai-roadmap"
  day          = "day-9"
  focus        = "terraform-basics"
}

output "project_summary" {
  value = "Project ${local.project_name} is practicing ${local.focus} on ${local.day}."
}
