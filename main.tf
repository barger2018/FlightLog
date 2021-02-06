terraform {
  backend "remote" {
    organization = "bargerweb"

    workspaces {
      name = "FlightLog"
    }
  }
}

provider "aws" {}

module vm {
   source = "./FlightLog.Terraform/mod-vm"
}