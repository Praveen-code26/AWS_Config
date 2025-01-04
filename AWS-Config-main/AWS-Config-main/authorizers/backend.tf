terraform {
  backend "s3" {
    bucket = "automation-terraform-state"
    key    = "devops-infrastructure/prod/config-authorizers/terraform.tfstate"
    region = "us-east-2"
  }
}
