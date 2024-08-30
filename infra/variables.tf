variable "aws_region" {
  type        = string
  description = "Default region"
}

variable "project_name" {
  type        = string
  description = "Project name"
}

variable "project_version" {
  type        = string
  description = "Project version"
}

variable "home_path" {
  type        = string
  description = "Home path"
}

variable "private_key_name" {
  type        = string
  description = "Private key name"
}

variable "private_key_path" {
  type        = string
  description = "Private key path"
}

variable "shared_credentials_file" {
  type        = string
  description = "Shared credentials file"
}

variable "vpc_cidr" {
  type        = string
  description = "Public Subnet CIDR values"
}

variable "vpc_name" {
  type        = string
  description = "DevOps Project 1 VPC 1"
}

variable "cidr_public_subnet" {
  type        = list(string)
  description = "Public Subnet CIDR values"
}

variable "cidr_private_subnet" {
  type        = list(string)
  description = "Private Subnet CIDR values"
}

variable "eu_availability_zone" {
  type        = list(string)
  description = "Availability Zones"
}

variable "public_key" {
  type        = string
  description = "DevOps Project 1 Public key for EC2 instance"
}

variable "ec2_ami_id" {
  type        = string
  description = "DevOps Project 1 AMI Id for EC2 instance"
}

variable "ec2_instance_type" {
  type        = string
  description = "DevOps Project 1 EC2 instance type"
}

variable "domain_name" {
  type        = string
  description = "Domain name for hosted zone"
}

variable "endpoint_name" {
  type        = string
  description = "API endpoint name"
}

variable "s3_bucket_backend_name" {
  type        = string
  description = "S3 bucket name for backend"
}