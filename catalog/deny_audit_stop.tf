resource "aws_organizations_policy" "deny_audit_stop" {
  name        = "DenyAuditStop"
  description = "Prevent audit processes from being stopped"
  content     = data.aws_iam_policy_document.deny_audit_stop.json
  type        = "SERVICE_CONTROL_POLICY"
  tags = {
    "acme-service" = "Organization Policy Catalog"
    "acme-vendor"  = "jrbeverly"
    "acme-url"     = "https://github.com/jrbeverly/aws-organizations-policies"
  }
}

data "aws_iam_policy_document" "deny_audit_stop" {
  statement {
    sid    = "DenyCloudTrailStop"
    effect = "Deny"
    actions = [
      "cloudtrail:StopLogging",
    ]
    resources = ["*"]
  }
  statement {
    sid    = "DenyGuardDutyStop"
    effect = "Deny"
    actions = [
      "guardduty:DeleteDetector",
      "guardduty:DeleteInvitations",
      "guardduty:DeleteIPSet",
      "guardduty:DeleteMembers",
      "guardduty:DeleteThreatIntelSet",
      "guardduty:DisassociateFromMasterAccount",
      "guardduty:DisassociateMembers",
      "guardduty:StopMonitoringMembers",
    ]
    resources = ["*"]
  }
}