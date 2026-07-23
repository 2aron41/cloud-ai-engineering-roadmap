# Day 12 Mini Quiz

## 1. What is Terraform drift?

Terraform drift is a difference between the infrastructure declared in Terraform configuration and the real infrastructure that currently exists in the cloud provider.

For example, manually adding `TemporaryDrift = true` to the dev S3 bucket created drift because the tag existed in AWS but not in `s3.tf`.

## 2. Why is it dangerous to manually change Terraform-managed resources?

Manual changes bypass the normal Terraform review process and can make the real environment differ from the approved configuration.

This can cause unexpected plans, inconsistent environments, accidental reversals, operational confusion, and higher risk when someone later runs `terraform apply`.

## 3. What command detects drift?

```bash
terraform plan
```

Terraform refreshes the known resources from the provider and compares the real infrastructure with the configuration and state.

## 4. What does `terraform state list` show?

`terraform state list` shows the resource addresses Terraform currently tracks in the active state.

For this dev environment, it showed:

```text
aws_s3_bucket.dev
aws_s3_bucket_public_access_block.dev
aws_s3_bucket_versioning.dev
```

## 5. Why should Terraform state be protected?

State maps Terraform resource addresses to real cloud resources and stores resource attributes, IDs, outputs, and potentially sensitive infrastructure information.

Losing or corrupting state can make Terraform unable to manage existing resources safely. Exposing state can reveal infrastructure details.

## 6. What is the difference between changing AWS manually and changing Terraform code?

Changing AWS manually modifies the real resource immediately without updating the Terraform configuration.

Changing Terraform code records the intended change in version-controlled configuration. The change can then be reviewed with `terraform plan` before it is applied.

## 7. Why should dev resources be used for drift practice instead of production?

Development resources reduce the impact of mistakes and provide a safe place to learn state refresh, drift detection, imports, and cleanup.

Production drift practice could interrupt a live website, alter permissions, expose data, or damage customer-facing infrastructure.

## 8. What should you check before running `terraform destroy`?

Before destroying resources, check:

- The authenticated AWS account and identity
- The Terraform working directory and environment
- `terraform state list`
- The saved destroy plan
- Every resource marked for destruction
- Whether the S3 bucket contains objects or versions
- That no production resource appears
- That a backup and recovery plan exist

## 9. Why are reusable modules helpful?

Reusable modules reduce duplicated configuration, standardize infrastructure patterns, improve consistency, and make tested components easier to use across environments.

Modules also allow environment-specific values to be supplied through inputs while the core resource design remains reusable.

## 10. Why should website uploads stay outside Terraform?

Website files change more frequently than infrastructure and are better handled by a deployment workflow such as GitHub Actions.

Terraform should manage long-lived infrastructure such as S3, CloudFront, access controls, and IAM. A deployment workflow should upload application files and create CloudFront invalidations.
