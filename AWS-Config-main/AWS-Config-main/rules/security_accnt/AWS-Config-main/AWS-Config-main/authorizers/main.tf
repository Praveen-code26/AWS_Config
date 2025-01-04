module "staging" {
    source = "./staging" 
    aggregator_account_id = var.aggregator_account_id
}

# module "prod" {
#     source = "./prod" 
#     aggregator_account_id = var.aggregator_account_id
# }