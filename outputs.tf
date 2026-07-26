output "enabled" {
  description = "Whether the module is enabled."
  value       = local.enabled
}

output "id" {
  description = "The id (dashboard name) of the CloudWatch dashboard."
  value       = try(aws_cloudwatch_dashboard.this[0].id, null)
}

output "dashboard_arn" {
  description = "The ARN of the CloudWatch dashboard."
  value       = try(aws_cloudwatch_dashboard.this[0].dashboard_arn, null)
}
