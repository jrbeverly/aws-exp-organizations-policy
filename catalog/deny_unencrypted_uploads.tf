resource "aws_organizations_policy" "deny_unencrypted_uploads" {
  name        = "DenyUnencryptedS3Uploads"
  description = "Prevent unencrypted uploads to AWS S3 Buckets"
  content     = data.aws_iam_policy_document.deny_unencrypted_uploads.json
  type        = "SERVICE_CONTROL_POLICY"
  tags = {
    "acme-service" = "Organization Policy Catalog"
    "acme-vendor"  = "jrbeverly"
    "acme-url"     = "https://github.com/jrbeverly/aws-organizations-policies"
  }
}

data "aws_iam_policy_document" "deny_unencrypted_uploads" {
  statement {
    sid       = "DenyUnencryptedUploads"
    effect    = "Deny"
    actions   = ["s3:PutObject"]
    resources = ["arn:aws:s3:::*/*"]

    condition {
      test     = "Null"
      variable = "s3:x-amz-server-side-encryption"

      values = [
        "true",
      ]
    }
  }
}