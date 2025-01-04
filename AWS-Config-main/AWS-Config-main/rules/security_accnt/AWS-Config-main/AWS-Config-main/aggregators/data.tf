data "aws_caller_identity" "current" {}

data "aws_iam_policy_document" "config_trust_relationship" {
    statement {
        actions = [ 
            "sts:AssumeRole"
        ]
        principals {
            type = "Service"
            identifiers = ["config.amazonaws.com"]
        }
    }
}