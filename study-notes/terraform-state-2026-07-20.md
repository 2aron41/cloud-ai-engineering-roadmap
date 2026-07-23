# Terraform State Notes

## What resources are currently in Terraform state?

The recovered local Terraform state contains exactly three development resources:

- `aws_s3_bucket.dev`
- `aws_s3_bucket_public_access_block.dev`
- `aws_s3_bucket_versioning.dev`

All three resources manage the development bucket:

`aws-serverless-portfolio-dev-2aron41-8ab73efa81e3bceff8c0a3d066`

No production S3 bucket, CloudFront distribution, IAM deployment role, or other production resource is in this state.

## What does `terraform state list` show?

`terraform state list` shows the resource addresses Terraform currently tracks in the active state file.

The command returned:

```text
aws_s3_bucket.dev
aws_s3_bucket_public_access_block.dev
aws_s3_bucket_versioning.dev
```

This confirmed that Terraform manages only the three intended development resources.

## What does `terraform show` show?

`terraform show` displays detailed information stored in Terraform state, including resource IDs, attributes, tags, public-access-block settings, versioning configuration, and outputs.

It provides more detail than `terraform state list`, which only displays resource addresses.

## What did the post-apply `terraform plan` show?

The original local state was missing from the current Codespace, so the three existing development resources were safely imported back into Terraform state.

After the imports, `terraform plan` returned:

```text
No changes. Your infrastructure matches the configuration.
```

During drift practice, Terraform detected the manually added `TemporaryDrift = true` tag and proposed an in-place update:

```text
Plan: 0 to add, 1 to change, 0 to destroy.
```

After the tag was manually removed, the final plan returned to:

```text
No changes. Your infrastructure matches the configuration.
```

## Why is local state risky?

Local state exists only in the current machine or development environment.

It can be lost if a Codespace is rebuilt, deleted, or replaced. Other machines do not automatically receive the state, and local state does not provide a shared locking mechanism for coordinated work.

This exercise demonstrated the risk because the dev bucket still existed in AWS, but the original local state file was missing.

## Why should state not be committed to GitHub?

Terraform state can contain resource IDs, account details, generated values, infrastructure structure, and potentially sensitive attributes.

State also changes frequently, which can create merge conflicts or multiple incorrect copies.

The portfolio repository ignores `*.tfstate` and `*.tfstate.*`. The recovered state and its protected backup were kept outside Git tracking.

## What would remote state solve later?

A remote backend would provide a durable, centralized state location outside the temporary Codespace.

Depending on the backend, remote state can provide:

- Centralized access
- Encryption
- Version history
- Backup and recovery
- Access control
- State locking
- A consistent state source for automation and team workflows

Remote-state migration must be planned and tested safely before it is used for production infrastructure.

## State Recovery Performed

The current Codespace did not contain the original local state file.

The existing dev resources were imported using their confirmed Terraform addresses and exact S3 bucket name.

After recovery:

- `terraform state list` showed all three intended resources
- `terraform output` returned the correct development values
- A protected backup was created outside the repository
- `terraform plan` returned `No changes`
- No AWS resource was created, replaced, or destroyed
- Production resources remained unchanged
