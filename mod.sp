mod "aws_compliance" {
  # hub metadata
  title         = "AWS Compliance"
  description   = "Run individual configuration, compliance and security controls or full compliance benchmarks for CIS, PCI, NIST, HIPAA, RBI CSF, and AWS Foundational Security Best Practices controls across all your AWS accounts using Steampipe."
  color         = "#FF9900"
  documentation = file("./docs/index.md")
  icon          = "/images/mods/turbot/aws-compliance.svg"
  categories    = ["aws", "cis", "compliance", "pci dss", "public cloud", "security"]

  opengraph {
    title        = "Steampipe Mod for AWS Compliance"
    description  = "Run individual configuration, compliance and security controls or full compliance benchmarks for CIS, PCI, NIST, HIPAA, RBI CSF, and AWS Foundational Security Best Practices controls across all your AWS accounts using Steampipe."
    image        = "/images/mods/turbot/aws-compliance-social-graphic.png"
  }
}
