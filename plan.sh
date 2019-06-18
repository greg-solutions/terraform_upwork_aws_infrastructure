#!/usr/bin/env bash
terraform get
terraform plan -refresh=true -var-file=variables.tfvars -out=plan.bin
