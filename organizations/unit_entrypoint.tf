resource "aws_organizations_organizational_unit" "entrypoint" {
  name      = "${aws_organizations_organizational_unit.root.name}-entrypoint"
  parent_id = aws_organizations_organizational_unit.root.id
  tags = {
    "acme-service"     = "Organization Policy Catalog"
    "acme-vendor"      = "jrbeverly"
    "acme-url"         = "https://github.com/jrbeverly/aws-organizations-policies"
    "acme-description" = "Entrypoint to the AWS Infrastructure"
  }
}

resource "aws_organizations_organizational_unit" "entrypoint_sso" {
  name      = "${aws_organizations_organizational_unit.entrypoint.name}-sso"
  parent_id = aws_organizations_organizational_unit.entrypoint.id
  tags = {
    "acme-service"     = "Organization Policy Catalog"
    "acme-vendor"      = "jrbeverly"
    "acme-url"         = "https://github.com/jrbeverly/aws-organizations-policies"
    "acme-description" = "The SSO Entrypoint"
  }
}

resource "aws_organizations_organizational_unit" "entrypoint_actions" {
  name      = "${aws_organizations_organizational_unit.entrypoint.name}-actions"
  parent_id = aws_organizations_organizational_unit.entrypoint.id
  tags = {
    "acme-service"     = "Organization Policy Catalog"
    "acme-vendor"      = "jrbeverly"
    "acme-url"         = "https://github.com/jrbeverly/aws-organizations-policies"
    "acme-description" = "Entrypoint for GitHub Actions publishing into AWS"
  }
}
