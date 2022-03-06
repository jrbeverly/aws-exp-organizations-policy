resource "aws_organizations_policy" "full_aws_access" {
  name        = "AllowFullAWSAccess"
  description = "Allows access to every operation"
  content     = data.aws_iam_policy_document.full_aws_access.json
  type        = "SERVICE_CONTROL_POLICY"
  tags = {
    "acme-service" = "Organization Policy Catalog"
    "acme-vendor"  = "jrbeverly"
    "acme-url"     = "https://github.com/jrbeverly/aws-organizations-policies"
  }
}

data "aws_iam_policy_document" "full_aws_access" {
  statement {
    sid       = "AllowAllAccess"
    effect    = "Allow"
    actions   = ["*"]
    resources = ["*"]
  }
}

# Looking for an AWS Service Control Policy Catalog
# Best way to construct a set of common policies that can be applied to various OUs.
# Cloudposse Examples
# DenyDeletingKMSKeys
# DenyDeletingCloudWatchLogs (?)
# DenyCreatingIAMUsers
# ProtectIAMRoles
# DenyLeavingOrganization
# DenyRootAccountAccess
# DenyDeletingRoute53Zones
# ProtectS3Buckets
# DenyS3BucketsPublicAccess
# DenyS3IncorrectEncryptionHeader
# DenyS3UnEncryptedObjectUploads


