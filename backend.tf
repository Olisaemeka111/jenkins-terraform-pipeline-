terraform {
  backend "s3" {
    bucket         = "ofujiworldwide12345"
    key            = "Website-EKS/terraform.tfstate"
    region         = "us-east-1"
  }
}

