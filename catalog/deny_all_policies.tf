resource "aws_organizations_policy" "deny_all" {
  name        = "DenyAllAccess"
  description = "By default, deny all AWS Actions"
  content     = data.aws_iam_policy_document.deny_all.json
  type        = "SERVICE_CONTROL_POLICY"
  tags = {
    "acme-service" = "Organization Policy Catalog"
    "acme-vendor"  = "jrbeverly"
    "acme-url"     = "https://github.com/jrbeverly/aws-organizations-policies"
  }
}

data "aws_iam_policy_document" "deny_all" {
  statement {
    sid       = "DenyAllAccess"
    effect    = "Deny"
    actions   = ["*"]
    resources = ["*"]
  }
}