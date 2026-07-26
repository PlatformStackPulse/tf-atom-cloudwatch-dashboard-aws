# -----------------------------------------------------------------------------
# Complete example: tf-atom-cloudwatch-dashboard-aws
# -----------------------------------------------------------------------------

provider "aws" {
  region = "eu-west-1"
}

module "cloudwatch_dashboard" {
  source = "../../"

  namespace   = "eg"
  environment = "euw1"
  stage       = "app"
  name        = "api-overview"

  dashboard_body = jsonencode({
    widgets = [
      {
        type   = "text"
        x      = 0
        y      = 0
        width  = 24
        height = 2
        properties = {
          markdown = "# API Overview"
        }
      }
    ]
  })
}

output "dashboard_arn" {
  description = "ARN of the CloudWatch dashboard."
  value       = module.cloudwatch_dashboard.dashboard_arn
}
