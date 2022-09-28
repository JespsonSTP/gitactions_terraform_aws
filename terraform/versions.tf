terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
  backend "s3" {
    bucket = "jespecsapp"
    key    = "jespecsapp/stage/terraform.tfstate"
    region = "us-east-1"
    dynamodb_table = "jespecsapp-stage-state-lock"
    encrypt        = true
  }
}