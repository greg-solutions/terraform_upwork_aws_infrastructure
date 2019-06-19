# terraform
##Init backend
* Set bucket name for s3 backend in init.tf file


 aws-iam-authenticator token -i prod --token-only
 
 kubectl expose service mongo --port=27017 --target-port=27017 --name=mongo-lb-service --type=LoadBalancer