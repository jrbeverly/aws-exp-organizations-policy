resource "aws_organizations_policy" "deny_kms_delete" {
  name        = "DenyDeleteKMS"
  description = "Prevent KMS Keys being deletion"
  content     = data.aws_iam_policy_document.deny_kms_delete.json
  type        = "SERVICE_CONTROL_POLICY"
  tags = {
    "acme-service" = "Organization Policy Catalog"
    "acme-vendor"  = "jrbeverly"
    "acme-url"     = "https://github.com/jrbeverly/aws-organizations-policies"
  }
}

data "aws_iam_policy_document" "deny_kms_delete" {
  statement {
    sid    = "DenyDeleteKMS"
    effect = "Deny"
    actions = [
      "kms:ScheduleKeyDeletion",
      "kms:Delete*",
    ]
    resources = ["*"]
  }
}