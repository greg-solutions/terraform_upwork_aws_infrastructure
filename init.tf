/* 
  The terraform configuration section is used to configure Terraform itself, 
  such as requiring a minimum Terraform version to execute a configuration.
*/
terraform {

  /*
    A "backend" in Terraform determines how state is loaded and how an operation such as apply is executed. 
    This abstraction enables non-local file state storage, remote execution, etc.
    
    Terraform must initialize any configured backend before use. This can be done by simply running terraform init.
    
    Backends determine where state is stored. For example, the local (default) backend stores state in a local JSON 
    file on disk. The  backend stores the state within . Both of these backends happen to provide locking:
    local via system APIs and  via locking APIs.

    When using a non-local backend, Terraform will not persist the state anywhere on disk except in the case of 
    a non-recoverable error where writing the state to the backend failed. This behavior is a major benefit for 
    backends: if sensitive values are in your state, using a remote backend allows you to use Terraform without 
    that state ever being persisted to disk.
    
    S3 Backend stores the state as a given key in a given bucket on Amazon S3. This backend also supports state locking 
    and consistency checking via Dynamo DB, which can be enabled by setting the dynamodb_table field to an existing 
    DynamoDB table name.
  */
  backend "s3" {
    bucket = "gs-vadim-terraform-backend"
    key = "terraform.tfstate"
    region = "us-east-1"
    shared_credentials_file ="./credentials"
  }
}