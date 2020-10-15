variable "aws_access_key" {}
variable "aws_secret_key" {}

variable "aws_region" {
  description = "AWS Region"
  default = "eu-central-1"
}

variable "aws_az_1a" {
  description = "AWS Region Avibility Zone A"
  default = "eu-central-1a"
}

variable "aws_az_1b" {
  description = "AWS Region Avibility Zone B"
  default = "eu-central-1b"
}

variable "aws_az_1c" {
  description = "AWS Region Avibility Zone C"
  default = "eu-central-1c"
}

variable "vpc_cidr" {
  description = "VPC CIDR"
  default = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
  description = "CIDR for the Public Subnet"
  default = "10.0.0.0/24"
}

variable "private_subnet_cidr" {
  description = "CIDR for the Private Subnet"
  default = "10.0.10.0/24"
}
