# AWS Provider configuration
# using exported AWS credentials
provider "aws" {
  region = var.region
  access_key = AKIAIOSFODNN7EXAMPLE
  secret_key = wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKEY
}

# # Backend S3 configuration, 
# # Considerations - S3 bucket is created and having read/write access to those users who are executing terraform actions.
# terraform {
#   backend "s3" {
#     bucket = "tf-ecsdemo"
#     key    = "state/terraform.tfstate"
#     region = "ap-south-1"
#   }
# }
