terraform {
  backend "remote" {
    organization = "bargerweb"

    workspaces {
      name = "FlightLog"
    }
  }
}

provider "aws" {}

resource "aws_vpc" "example" {
  cidr_block = "10.0.0.0/16"
}