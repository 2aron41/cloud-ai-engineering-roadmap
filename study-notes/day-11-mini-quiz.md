# Day 11 Mini Quiz

## 1. Why did we create a dev S3 bucket instead of touching production?

Answer:Creating a separate dev bucket isolates testing and experimentation, preventing accidental service disruptions, data loss, or downtime on the live production portfolio.

## 2. What does S3 Block Public Access protect against?

Answer:It acts as a centralized safety control that overrides permissive policies to prevent anonymous, unauthorized public internet access to your S3 bucket and its objects.

## 3. Why must S3 bucket names be unique?

Answer: S3 general-purpose bucket names must be unique across all AWS accounts within the same AWS partition because bucket names are used in globally addressable S3 endpoints.

## 4. What is the difference between `plan` and `apply`?

Answer:terraform plan previews the proposed infrastructure changes without making them, whereas terraform apply executes those changes to create, modify, or destroy real AWS resources.

## 5. What should you check before approving `terraform apply`?

Answer:You should review the resource count summary, verify the target environment/AWS account, and confirm that only intended resources are being added, changed, or destroyed

## 6. Why are tags useful?

Answer:Tags add key-value metadata to resources, making it easy to organize cost allocation, track resource ownership, manage environment boundaries, and enforce automation or access policies.

## 7. Why should Terraform state be protected after apply?

Answer:State files map declared code to live AWS resources and contain plain-text metadata and potential secrets, making loss or corruption a risk for resource tracking or unauthorized exposure.

## 8. What would happen if Terraform managed the wrong bucket?

Answer: Terraform could change or delete the wrong bucket's configuration to make it match the declared code. Depending on the configuration, this could cause downtime, access problems, or data loss. Objects would not be automatically deleted unless destructive behavior such as `force_destroy` were enabled.

## 9. Why should secrets not be placed in `.tfvars` files committed to GitHub?

Answer:.tfvars files are committed as plain text to version control, exposing embedded API keys, passwords, or tokens to anyone with repository access.

## 10. What evidence proves the production portfolio was not changed?

Answer: The reviewed Terraform plan contained only the three dev S3 resource addresses and showed 3 to add, 0 to change, and 0 to destroy. Terraform state contains only those dev resources. Read-only verification can also confirm that the production S3 files, public-access settings, CloudFront configuration, and live portfolio behavior remain unchanged.

## Final Score

- First attempt: 9/10
- Corrected score: 10/10
