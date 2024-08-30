terraform {
  backend "s3" {
    bucket = "dev-node-0-1-1-terraform-remote-state-bucket"
    key    = "terraform/0.1.1/terraform.tfstate"
    region = "ap-southeast-1"
  }
}