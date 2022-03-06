resource "aws_organizations_organizational_unit" "workloads" {
  name      = "${aws_organizations_organizational_unit.root.name}-workloads"
  parent_id = aws_organizations_organizational_unit.root.id
  tags = {
    "acme-service"     = "Organization Policy Catalog"
    "acme-vendor"      = "jrbeverly"
    "acme-url"         = "https://github.com/jrbeverly/aws-organizations-policies"
    "acme-description" = "Service workloads running in AWS"
  }
}

resource "aws_organizations_organizational_unit" "network" {
  name      = "${aws_organizations_organizational_unit.root.name}-network"
  parent_id = aws_organizations_organizational_unit.root.id
  tags = {
    "acme-service"     = "Organization Policy Catalog"
    "acme-vendor"      = "jrbeverly"
    "acme-url"         = "https://github.com/jrbeverly/aws-organizations-policies"
    "acme-description" = "Primary configuration of networking"
  }
}
