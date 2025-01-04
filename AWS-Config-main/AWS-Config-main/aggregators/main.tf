Root Organization account number is replaced in the ***********

resource "aws_config_configuration_aggregator" "organization" {
  depends_on = [aws_iam_role_policy_attachment.organization]

  name = "organization"

  organization_aggregation_source {
    all_regions = true
    role_arn    = aws_iam_role.organization.arn
  }
}

resource "aws_iam_role" "organization" {
  name = "org-aggregator"
  permissions_boundary = aws_iam_policy.customer_access_boundary.arn
  assume_role_policy = data.aws_iam_policy_document.config_trust_relationship.json
}

resource "aws_iam_role_policy_attachment" "organization" {
  role       = aws_iam_role.organization.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSConfigRoleForOrganizations"
}


resource "aws_iam_policy" "customer_access_boundary" {
  name = "customer_access_boundary"
 
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "*",
        ]
        Effect   = "Allow"
        Resource = "*"
      },
      {
      Action = [
        "account:*",
        "aws-portal:*Billing",
        "aws-portal:*Usage",
        "aws-portal:*PaymentMethods",
        "budgets:ViewBudget",
        "budgets:ModifyBudget",
        "ce:*",
        "cur:*",
        "support:*"
        ]
        Effect   = "Deny"
        Resource = "*"
      },
      {
      Action = [
        "ec2:AcceptReservedInstancesExchangeQuote",
        "ec2:ModifyReservedInstances",
        "ec2:PurchaseReservedInstancesOffering",
        "elasticache:PurchaseReservedCacheNodesOffering",
        "es:PurchaseReservedElasticsearchInstanceOffering",
        "es:PurchaseReservedInstanceOffering",
        "purchase-orders:*PurchaseOrders",
        "redshift:PurchaseReservedNodeOffering",
        "rds:PurchaseReservedDBInstancesOffering",
        "savingsplans:CreateSavingsPlan"
            ]
        Effect   = "Deny"
        Resource = "*"
      },
      {
      Action = [
        "iam:DeletePolicy",
        "iam:DeletePolicyVersion",
        "iam:CreatePolicyVersion",
        "iam:SetDefaultPolicyVersion"
            ],
        Effect   = "Deny"
        Resource = "arn:aws:iam::${data.aws_caller_identity.current.account_id}:policy/customer-access-boundary"
      },
      {
      Action = [
        "ec2:AcceptReservedInstancesExchangeQuote",
        "ec2:ModifyReservedInstances",
        "ec2:PurchaseReservedInstancesOffering",
        "elasticache:PurchaseReservedCacheNodesOffering",
        "es:PurchaseReservedElasticsearchInstanceOffering",
        "es:PurchaseReservedInstanceOffering",
        "purchase-orders:*PurchaseOrders",
        "redshift:PurchaseReservedNodeOffering",
        "rds:PurchaseReservedDBInstancesOffering",
        "savingsplans:CreateSavingsPlan"
            ]
        Effect   = "Deny"
        Resource = "*"
      },
      {
      Action = [
        "iam:DeleteUserPermissionsBoundary",
        "iam:DeleteRolePermissionsBoundary"
            ],
        Effect   = "Deny"
        Resource = [
        "arn:aws:iam::***********:user/*", 
        "arn:aws:iam::***********:role/*"
        ]
        Condition = {
          StringEquals = {
            "iam:PermissionsBoundary" = "arn:aws:iam::${data.aws_caller_identity.current.account_id}:policy/customer-access-boundary"
          }
        }
      },
      {
      Action = [
        "iam:PutUserPermissionsBoundary",
        "iam:PutRolePermissionsBoundary"
            ],
        Effect   = "Deny"
        Resource = [
        "arn:aws:iam::***********:user/*", 
        "arn:aws:iam::***********:role/*"
        ]
        Condition = {
          StringNotEquals = {
            "iam:PermissionsBoundary" = "arn:aws:iam::${data.aws_caller_identity.current.account_id}:policy/customer-access-boundary"
          }
        }
      },
      {
      Action = [
        "iam:CreateUser",
        "iam:CreateRole"
            ],
        Effect   = "Deny"
        Resource = [
        "arn:aws:iam::***********:user/*", 
        "arn:aws:iam::***********:role/*"
        ]
        Condition = {
          StringNotEquals = {
            "iam:PermissionsBoundary" = "arn:aws:iam::${data.aws_caller_identity.current.account_id}:policy/customer-access-boundary"
          }
        }
      }
    ]
  })
}
