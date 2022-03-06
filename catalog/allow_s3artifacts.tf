resource "aws_organizations_policy" "allow_s3_artifacts" {
  name        = "AllowS3Artifacts"
  description = "Allow AWS S3 Artifacts"
  content     = data.aws_iam_policy_document.allow_s3_artifacts.json
  type        = "SERVICE_CONTROL_POLICY"
  tags = {
    "acme-service" = "Organization Policy Catalog"
    "acme-vendor"  = "jrbeverly"
    "acme-url"     = "https://github.com/jrbeverly/aws-organizations-policies"
  }
}

data "aws_iam_policy_document" "allow_s3_artifacts" {
  statement {
    sid    = "AllowS3Artifacts"
    effect = "Allow"
    actions = [
      "s3:*",
    ]
    resources = ["*"]
  }
}