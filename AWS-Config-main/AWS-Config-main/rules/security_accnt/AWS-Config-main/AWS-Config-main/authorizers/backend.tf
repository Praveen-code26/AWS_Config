terraform {
  backend "s3" {
    bucket = "365markets-non-prod-automation-terraform-state"
    key    = "devops-infrastructure/prod/config-authorizers/terraform.tfstate"
    region = "us-east-2"
  }
}
