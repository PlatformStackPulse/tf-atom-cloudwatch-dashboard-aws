# -----------------------------------------------------------------------------
# Module-Specific Variables
#
# Note: Standard labeling variables (enabled, namespace, tenant, environment,
# stage, name, delimiter, attributes, tags, label_order, etc.) are provided
# by context.tf via the tf-label module.
# -----------------------------------------------------------------------------

variable "dashboard_name" {
  description = "Name of the CloudWatch dashboard. Defaults to the tf-label id (module.this.id) when null."
  type        = string
  default     = null
}

variable "dashboard_body" {
  description = "JSON document describing the dashboard widgets and layout."
  type        = string

  validation {
    condition     = can(jsondecode(var.dashboard_body))
    error_message = "dashboard_body must be a valid JSON document."
  }
}
