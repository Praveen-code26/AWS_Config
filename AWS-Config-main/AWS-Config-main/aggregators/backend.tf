terraform {
  backend "s3" {
    bucket = "devops-terraform-state"
    key    = "aws-config/prod/config-aggregators/terraform.tfstate"
    region = "us-east-2"
  }
}
