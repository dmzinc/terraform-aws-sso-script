terraform {
  backend "remote" {
    hostname     = "app.terraform.io"
    organization = "Forbes22"


    workspaces {
      prefix = "terraform-sso-script-"
    }
  }
}
