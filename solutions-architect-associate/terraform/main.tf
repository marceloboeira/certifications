provider "aws" {
  version                 = "~> 2"
  region                  = "eu-central-1"
  shared_credentials_file = "../../shared/credentials"
}

provider "aws" {
  version                 = "~> 2"
  alias                   = "eu_west_1"
  region                  = "eu-west-1"
  shared_credentials_file = "../../shared/credentials"
}
