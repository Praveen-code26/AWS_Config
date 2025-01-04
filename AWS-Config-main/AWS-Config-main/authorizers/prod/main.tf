resource "aws_config_aggregate_authorization" "example" {
  account_id = var.aggregator_account_id
  region     = "us-west-2"
}