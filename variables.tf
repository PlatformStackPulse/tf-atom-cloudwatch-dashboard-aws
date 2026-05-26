variable "dashboard_body" {
  description = "JSON body of the dashboard"
  type        = string
  validation {
    condition     = length(var.dashboard_body) > 0
    error_message = "dashboard_body must not be empty."
  }
}
