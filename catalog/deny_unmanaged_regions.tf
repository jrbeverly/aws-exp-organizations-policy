resource "aws_organizations_policy" "restrict_regions" {
  name        = "DenyUnmanagedRegions"
  description = "Deny operations in unmanaged regions"
  content     = data.aws_iam_policy_document.restrict_regions.json
  type        = "SERVICE_CONTROL_POLICY"
  tags = {
    "acme-service" = "Organization Policy Catalog"
    "acme-vendor"  = "jrbeverly"
    "acme-url"     = "https://github.com/jrbeverly/aws-organizations-policies"
  }
}

data "aws_iam_policy_document" "restrict_regions" {
  statement {
    sid       = "RegionRestriction"
    effect    = "Deny"
    actions   = ["*"]
    resources = ["*"]

    condition {
      test     = "StringNotEquals"
      variable = "aws:RequestedRegion"

      values = [
        "us-east-1",
        "us-east-2",
        "ca-central-1",
      ]
    }
  }
}