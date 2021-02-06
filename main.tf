terraform {
  backend "remote" {
    organization = "bargerweb"

    workspaces {
      name = "FlightLog"
    }
  }
}

provider "aws" {
    region = "us-east-1"
  }

resource "aws_vpc" "example" {
  cidr_block = "10.0.0.0/16"
}