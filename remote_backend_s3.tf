terraform {
  backend "s3" {
    bucket = "dev-proj-1-terraform-remote-state-bucket-123456"
    key    = "devops-project-1/state.0.0.2/terraform.tfstate"
    region = "ap-southeast-1"
  }
}