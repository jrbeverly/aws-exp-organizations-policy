resource "aws_organizations_policy" "deny_iam_user" {
  name        = "DenyIAMUsers"
  description = "Prevent IAM Users within the AWS Organization unit"
  content     = data.aws_iam_policy_document.deny_iam_user.json
  type        = "SERVICE_CONTROL_POLICY"
  tags = {
    "acme-service" = "Organization Policy Catalog"
    "acme-vendor"  = "jrbeverly"
    "acme-url"     = "https://github.com/jrbeverly/aws-organizations-policies"
  }
}

data "aws_iam_policy_document" "deny_iam_user" {
  statement {
    sid    = "PreventIAMUserCreate"
    effect = "Deny"
    actions = [
      "iam:CreateAccessKey",
      "iam:CreateGroup",
      "iam:AddUserToGroup",
      "iam:CreateUser"
    ]
    resources = ["*"]
  }
}