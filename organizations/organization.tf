data "aws_organizations_organization" "org" {}

resource "aws_organizations_organizational_unit" "root" {
  name      = var.name
  parent_id = data.aws_organizations_organization.org.roots[0].id
  tags = {
    "acme-service"     = "Organization Policy Catalog"
    "acme-vendor"      = "jrbeverly"
    "acme-url"         = "https://github.com/jrbeverly/aws-organizations-policies"
    "acme-description" = "Top level organization unit for the Organization"
  }
}