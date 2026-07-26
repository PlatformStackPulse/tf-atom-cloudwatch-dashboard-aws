# -----------------------------------------------------------------------------
# tf-atom-cloudwatch-dashboard-aws
#
# Single-resource atom: one aws_cloudwatch_dashboard, gated by the standard
# `enabled` flag from context.tf. This resource has no tags.
# -----------------------------------------------------------------------------

resource "aws_cloudwatch_dashboard" "this" {
  count = local.enabled ? 1 : 0

  dashboard_name = coalesce(var.dashboard_name, module.this.id)
  dashboard_body = var.dashboard_body
}
