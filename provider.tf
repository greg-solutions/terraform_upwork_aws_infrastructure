/*
  A provider is responsible for understanding API interactions and exposing resources. 
  Providers generally are an IaaS (e.g. AWS, GCP, Microsoft Azure, OpenStack), PaaS (e.g. Heroku), 
  or SaaS services (e.g. Terraform Enterprise, DNSimple, CloudFlare).
  
  The Amazon Web Services (AWS) provider is used to interact with the many resources supported by AWS. 
  The provider needs to be configured with the proper credentials before it can be used - 
  see AWS_SHARED_CREDENTIALS_FILE environment variable.
*/
provider "aws" {
  region = "us-east-1"
  shared_credentials_file ="./credentials"
}
provider "kubernetes" {}


resource "kubernetes_namespace" "example" {
  metadata {
    name = "my-first-namespace"
  }
}