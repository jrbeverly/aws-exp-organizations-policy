resource "aws_organizations_policy" "deny_delete_logs" {
  name        = "DenyDeleteCloudWatchLogs"
  description = "Prevent Logs from being deleted, requiring them to expire"
  content     = data.aws_iam_policy_document.deny_delete_logs.json
  type        = "SERVICE_CONTROL_POLICY"
  tags = {
    "acme-service" = "Organization Policy Catalog"
    "acme-vendor"  = "jrbeverly"
    "acme-url"     = "https://github.com/jrbeverly/aws-organizations-policies"
  }
}

data "aws_iam_policy_document" "deny_delete_logs" {
  statement {
    sid    = "DenyDeleteCloudWatchLogs"
    effect = "Deny"
    actions = [
      "ec2:DeleteFlowLogs",
      "logs:DeleteLogGroup",
      "logs:DeleteLogStream",
    ]
    resources = ["*"]
  }
}