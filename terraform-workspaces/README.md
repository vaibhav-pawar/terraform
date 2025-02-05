
terraform init                  # Initialize terraform
terraform workspace list        # List total available workspaces
terraform workspace new dev     # Create dev workspace
terraform workspace new stg     # Create stg workspace
terraform workspace new prd     # Create prd workspace

terraform workspace select dev  # Select dev workspace
terraform workspace show        # Show currently selected workspace
terraform apply -var-file='./envs/dev/dev.tfvars' -auto-approve     # execute dev workspace

terraform workspace select stg  # Select dev workspace
terraform workspace show        # Show currently selected workspace
terraform apply -var-file='./envs/stg/stg.tfvars' -auto-approve     # execute dev workspace

terraform workspace select prd  # Select dev workspace
terraform workspace show        # Show currently selected workspace
terraform apply -var-file='./envs/prd/prd.tfvars' -auto-approve     # execute dev workspace