terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.region
  assume_role {
    role_arn    = var.assume_role.role_arn
    external_id = var.assume_role.external_id
  }

  default_tags {
    tags = {
      Project   = "colabkids"
      ManagedBy = "terraform"
    }
  }
}

terraform {
  backend "s3" {
    bucket         = "colabkids-terraform-state-bucket"
    key            = "./modules/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
    dynamodb_table = "colabkids-terraform-state-lock-table"
  }
}
