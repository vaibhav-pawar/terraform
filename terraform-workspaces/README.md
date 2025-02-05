# Terraform Project

## Overview
This repository contains Terraform configurations for managing infrastructure across different environments: `dev`, `stg`, and `prd`. Using Terraform workspaces, we ensure isolated and consistent infrastructure deployment.

## Prerequisites
Ensure you have the following installed:
- [Terraform](https://www.terraform.io/downloads)
- AWS CLI (if using AWS as the provider)
- Proper IAM permissions for managing infrastructure

## Terraform Initialization
Before using Terraform, initialize the working directory:
```sh
terraform init
```
This command sets up the Terraform environment by downloading required providers and initializing the backend.

## Managing Workspaces
Terraform workspaces help in maintaining separate states for different environments.

### List Available Workspaces
```sh
terraform workspace list
```

### Create Workspaces
```sh
terraform workspace new dev   # Create development workspace
terraform workspace new stg   # Create staging workspace
terraform workspace new prd   # Create production workspace
```

### Select and Use a Workspace
```sh
terraform workspace select dev  # Select dev workspace
terraform workspace show        # Show currently selected workspace
```

## Deploying Infrastructure
Use the appropriate `.tfvars` file for the target environment when applying Terraform configurations.

### Deploy to Development
```sh
terraform apply -var-file='./envs/dev/dev.tfvars' -auto-approve
```

### Deploy to Staging
```sh
terraform workspace select stg  # Select staging workspace
terraform workspace show        # Show currently selected workspace
terraform apply -var-file='./envs/stg/stg.tfvars' -auto-approve
```

### Deploy to Production
```sh
terraform workspace select prd  # Select production workspace
terraform workspace show        # Show currently selected workspace
terraform apply -var-file='./envs/prd/prd.tfvars' -auto-approve
```

## Best Practices
- Always review Terraform plans before applying changes:
  ```sh
  terraform plan -var-file='./envs/dev/dev.tfvars'
  ```
- Maintain separate `.tfvars` files for each environment.
- Use remote state management (e.g., S3 + DynamoDB for AWS) to avoid state conflicts.
- Follow Infrastructure-as-Code (IaC) best practices, such as versioning and modularization.

## Cleanup
To destroy the infrastructure if necessary, run:
```sh
terraform destroy -var-file='./envs/dev/dev.tfvars' -auto-approve
```
Repeat this for other environments by selecting the respective workspace.

---

Happy Terraforming! 🚀
