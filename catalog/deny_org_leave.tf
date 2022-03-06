resource "aws_organizations_policy" "deny_org_leave" {
  name        = "DenyLeavingOrganization"
  description = "Prevent AWS Accounts from leaving the AWS Organization"
  content     = data.aws_iam_policy_document.deny_org_leave.json
  type        = "SERVICE_CONTROL_POLICY"
  tags = {
    "acme-service" = "Organization Policy Catalog"
    "acme-vendor"  = "jrbeverly"
    "acme-url"     = "https://github.com/jrbeverly/aws-organizations-policies"
  }
}

data "aws_iam_policy_document" "deny_org_leave" {
  statement {
    sid    = "DenyLeavingOrganization"
    effect = "Deny"
    actions = [
      "organizations:LeaveOrganization",
    ]
    resources = ["*"]
  }
}