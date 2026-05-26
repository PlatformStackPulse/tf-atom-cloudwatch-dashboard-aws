output "enabled" {
  description = "Whether the module is enabled"
  value       = local.enabled
}

output "arn" {
  description = "ARN of the dashboard"
  value       = try(aws_cloudwatch_dashboard.this[0].dashboard_arn, null)
}
