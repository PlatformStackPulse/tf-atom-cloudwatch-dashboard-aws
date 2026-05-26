resource "aws_cloudwatch_dashboard" "this" {
  count = module.this.enabled ? 1 : 0

  dashboard_name = module.this.id
  dashboard_body = var.dashboard_body
}
