resource "aws_organizations_policy" "deny_delete_r53" {
  name        = "DenyDeletingRoute53Zones"
  description = "Prevent Route53 Hosted Zones from being removed"
  content     = data.aws_iam_policy_document.deny_delete_r53.json
  type        = "SERVICE_CONTROL_POLICY"
  tags = {
    "acme-service" = "Organization Policy Catalog"
    "acme-vendor"  = "jrbeverly"
    "acme-url"     = "https://github.com/jrbeverly/aws-organizations-policies"
  }
}

data "aws_iam_policy_document" "deny_delete_r53" {
  statement {
    sid    = "DenyDeletingRoute53Zones"
    effect = "Deny"
    actions = [
      "route53:DeleteHostedZone",
    ]
    resources = ["*"]
  }
}