terraform {
  backend "s3" {
    bucket = "365-devops-terraform-state-retail-payer"
    key    = "devops-infrastructure/prod/config-rules/terraform.tfstate"
    region = "us-west-2"
  }
}