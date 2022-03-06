resource "aws_organizations_policy" "deny_missing_ec2" {
  name        = "DenyEC2MissingTags"
  description = "Prevent EC2 Instances from being launched without tags"
  content     = data.aws_iam_policy_document.deny_missing_ec2.json
  type        = "SERVICE_CONTROL_POLICY"
  tags = {
    "acme-service" = "Organization Policy Catalog"
    "acme-vendor"  = "jrbeverly"
    "acme-url"     = "https://github.com/jrbeverly/aws-organizations-policies"
  }
}

data "aws_iam_policy_document" "deny_missing_ec2" {
  statement {
    sid    = "RequireTag"
    effect = "Deny"
    actions = [
      "ec2:RunInstances",
      "ec2:CreateVolume"
    ]
    resources = [
      "arn:aws:ec2:*:*:instance/*",
      "arn:aws:ec2:*:*:volume/*"
    ]

    condition {
      test     = "Null"
      variable = "aws:RequestTag/Name"
      values   = ["true"]
    }
  }
}
