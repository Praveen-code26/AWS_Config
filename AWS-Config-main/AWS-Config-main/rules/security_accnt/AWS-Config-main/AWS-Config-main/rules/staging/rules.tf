resource "aws_config_organization_managed_rule" "mfa-enabled" {
  name            = "mfa-enabled"
  rule_identifier = "IAM_USER_MFA_ENABLED"
}

resource "aws_config_organization_managed_rule" "ebs-in-use" {
  name            = "ebs-in-use"
  rule_identifier = "EC2_VOLUME_INUSE_CHECK"
}

resource "aws_config_organization_managed_rule" "root-mfa-enabled" {
  name            = "root-mfa-enabled"
  rule_identifier = "ROOT_ACCOUNT_MFA_ENABLED"
}