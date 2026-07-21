# Terraform Safety Notes

## Why should I run `terraform plan` before `apply`?

A plan reveals proposed creations, modifications, and deletions before Terraform changes infrastructure.

## Why should I avoid `terraform destroy` on real projects unless I am sure?

Destroy can permanently remove live infrastructure, stored data, endpoints, and security configurations.

## Why should state files be protected?

State can contain sensitive configuration values and detailed information about infrastructure.

## Why should secrets not be stored in Terraform files?

Terraform files are often committed to Git, where secrets could be exposed through repository history.

## Why should I start with a practice project before managing real AWS resources?

A harmless practice project teaches the workflow and failure modes without risking production resources.

## What AWS resources from my portfolio should I be extra careful with?

- The private S3 portfolio bucket and its stored website files
- The CloudFront distribution and Origin Access Control
- The S3 bucket policy and Block Public Access settings
- The GitHub OIDC provider
- The IAM deployment role and permissions policy

## Safety Rules

- Protect Terraform state.
- Never commit secrets.
- Review every plan before applying.
- Do not manage production infrastructure casually.
- Avoid `apply` and `destroy` until the proposed actions are understood.
