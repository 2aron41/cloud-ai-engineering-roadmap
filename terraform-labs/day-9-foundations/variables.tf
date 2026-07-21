variable "project_name" {
  description = "Name used as the prefix for the generated lab identifier."
  type        = string
  default     = "cloud-ai-roadmap"

  validation {
    condition     = length(trimspace(var.project_name)) >= 3
    error_message = "The project name must contain at least three characters."
  }
}
