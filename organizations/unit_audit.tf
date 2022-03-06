resource "aws_organizations_organizational_unit" "security" {
  name      = "${aws_organizations_organizational_unit.root.name}-security"
  parent_id = aws_organizations_organizational_unit.root.id
  tags = {
    "acme-service"     = "Organization Policy Catalog"
    "acme-vendor"      = "jrbeverly"
    "acme-url"         = "https://github.com/jrbeverly/aws-organizations-policies"
    "acme-description" = "Store artifacts for the AWS Organization"
  }
}

resource "aws_organizations_organizational_unit" "audit" {
  name      = "${aws_organizations_organizational_unit.root.name}-audit"
  parent_id = aws_organizations_organizational_unit.root.id
  tags = {
    "acme-service"     = "Organization Policy Catalog"
    "acme-vendor"      = "jrbeverly"
    "acme-url"         = "https://github.com/jrbeverly/aws-organizations-policies"
    "acme-description" = "Store artifacts for the AWS Organization"
  }
}

