provider "aws" {
    region = "eu-north-1"
}

module "db" {
   source = "./rds"
} 
