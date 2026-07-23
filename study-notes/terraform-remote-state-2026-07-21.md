# Terraform Remote State Notes

## Why local state caused a problem

The local Terraform state was tied to one Codespace and development environment.

When the original Codespace state was unavailable, the AWS resources still existed, but Terraform no longer had the local file that connected the configuration to those resources.

The three existing dev resources had to be recovered with `terraform import` before the remote-state migration could begin.

## Backup created before migration

Status: Completed

- Backup path: `/workspaces/terraform-state-backups/day-13-dev-state-before-remote.json`
- Backup permissions: `600`
- Backup location: Outside both Git repositories
- JSON validation: Passed
- SHA-256: `9c23a946a0bde294a01bee681c43c8c1ada262200cb457452ec17148672f7003`

## Current state resources before migration

- `aws_s3_bucket.dev`
- `aws_s3_bucket_public_access_block.dev`
- `aws_s3_bucket_versioning.dev`

The pre-migration Terraform plan returned:

```text
No changes. Your infrastructure matches the configuration.
```

## Dedicated S3 backend bucket

- Bucket: `cloud-ai-roadmap-terraform-state-510497448584-us-east-1`
- Region: `us-east-1`
- Purpose: Terraform state and native S3 lock files
- Public access: All four Block Public Access settings enabled
- Versioning: Enabled
- Encryption: SSE-S3 using `AES256`
- Managed by: Manual bootstrap

Tags:

- `Project = cloud-ai-roadmap`
- `Purpose = terraform-state`
- `Environment = shared`
- `ManagedBy = manual-bootstrap`

The backend bucket is separate from the dev bucket and production portfolio bucket because it stores Terraform state rather than application infrastructure.

## Backend configuration

The dev environment uses the following backend settings:

```hcl
terraform {
  backend "s3" {
    bucket       = "cloud-ai-roadmap-terraform-state-510497448584-us-east-1"
    key          = "aws-serverless-portfolio/dev/terraform.tfstate"
    region       = "us-east-1"
    encrypt      = true
    use_lockfile = true
  }
}
```

No AWS credentials were placed in `backend.tf`.

## State migration

The existing local state was migrated using:

```text
terraform init -migrate-state
```

Terraform copied the existing state into the dedicated S3 backend.

After migration, `terraform state list` still showed the same three dev-only resources.

The final Terraform plan returned:

```text
No changes. Your infrastructure matches the configuration.
```

## AWS verification

- Remote state object exists: Yes
- State key: `aws-serverless-portfolio/dev/terraform.tfstate`
- State object encryption: `AES256`
- Backend bucket versioning: Enabled
- Backend bucket public access blocked: Yes
- Historical `.tflock` versions observed: Yes
- Active lock object after commands completed: No
- Production resources changed: No

## Local-state cleanup

After remote-state verification, the root-level legacy state files were moved outside the repository to:

`/workspaces/terraform-state-backups/day-13-legacy-local-state/`

The empty post-migration `terraform.tfstate` and the earlier `terraform.tfstate.backup` were archived. The `.terraform/terraform.tfstate` backend metadata file was retained.

## What remote state solves

- Removes dependency on one temporary Codespace
- Provides centralized and durable state storage
- Supports state-object version history
- Supports access controls and encryption
- Supports S3-native state locking
- Gives future automation a consistent state location

## Lesson learned

A safe backend migration requires inspecting the current state, confirming a clean plan, creating a protected backup, securing the remote backend, migrating deliberately, and proving that the same resources remain tracked afterward.
