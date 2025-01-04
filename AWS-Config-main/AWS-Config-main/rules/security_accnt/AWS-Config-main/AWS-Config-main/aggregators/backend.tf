terraform {
  backend "s3" {
    bucket = "365-retail-markets-devops-terraform-state"
    key    = "aws-config/prod/config-aggregators/terraform.tfstate"
    region = "us-west-2"
  }
}
