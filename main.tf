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

module s3 {
   source = "./FlightLog.Terraform/mod-s3"
}

# module lb {
#    source = "./FlightLog.Terraform/mod-lb"

#    vpc-id = module.vm.vpc-id
#    main-cidr-group = module.vm.main-cidr-group
# }
