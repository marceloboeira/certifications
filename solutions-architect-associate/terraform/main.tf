provider "aws" {
  version                 = "~> 2.8"
  region                  = "eu-central-1"
  shared_credentials_file = "../../shared/credentials"
}

provider "aws" {
  alias                   = "replica"
  version                 = "~> 2.8"
  region                  = "eu-west-1"
  shared_credentials_file = "../../shared/credentials"
}
