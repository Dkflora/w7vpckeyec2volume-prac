terraform {
  backend "s3" {
    bucket       = "makasiw7backet"
    key          = "hompracwk7/terraform.tfstate"
    region       = "us-east-1"
    use_lockfile = false
  }
}
