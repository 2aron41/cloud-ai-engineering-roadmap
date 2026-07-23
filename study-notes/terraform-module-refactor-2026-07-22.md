# Terraform Module Refactor Notes

## Pre-refactor state resources

Before the refactor, Terraform tracked three dev resources at root-module addresses:

- `aws_s3_bucket.dev`
- `aws_s3_bucket_public_access_block.dev`
- `aws_s3_bucket_versioning.dev`

All three resources represented the existing development S3 bucket and its safety configuration.

## Pre-refactor plan result

The baseline Terraform plan returned:

```text
No changes. Your infrastructure matches the configuration.
```

This proved the real AWS infrastructure, remote state, and root Terraform configuration matched before refactoring.

## Backup status

Status: Completed

- Backup path: `/workspaces/terraform-state-backups/day-14-before-module-refactor.json`
- Backup stored outside both Git repositories
- File permissions restricted
- Backup created from the active remote state using `terraform state pull`

## Why a backup matters

A module refactor changes Terraform resource addresses. If the configuration or moved blocks are incorrect, Terraform could propose creating, replacing, or destroying resources.

A protected state backup provides a recovery point before changing resource addresses.

## Module created

The reusable module was completed in:

`infra/modules/static-site/`

Module files:

- `main.tf`
- `variables.tf`
- `outputs.tf`
- `README.md`

The module currently manages:

- S3 bucket
- S3 public access block
- S3 versioning
- S3 tags

The module accepts:

- `bucket_name`
- `enable_versioning`
- `tags`

The module preserves `force_destroy = false`, all four public-access protections, enabled versioning, and the five existing tags.

## Resources intentionally excluded

- CloudFront
- Origin Access Control
- IAM permissions
- Website uploads
- CloudFront invalidations
- Production infrastructure

## Moved blocks

Three Terraform moved blocks mapped the old root addresses to the new module addresses:

```text
aws_s3_bucket.dev
  -> module.static_site.aws_s3_bucket.this

aws_s3_bucket_public_access_block.dev
  -> module.static_site.aws_s3_bucket_public_access_block.this

aws_s3_bucket_versioning.dev
  -> module.static_site.aws_s3_bucket_versioning.this
```

Without these mappings, Terraform could interpret the refactor as deleting the old resources and creating new resources.

## Refactor plan result

The reviewed saved plan showed only address moves:

```text
Plan: 0 to add, 0 to change, 0 to destroy.
```

There were no replacements, new buckets, tag changes, CloudFront resources, IAM resources, or production changes.

## Apply result

The exact reviewed saved plan was applied.

Terraform updated its state addresses without changing the real S3 infrastructure.

## Final state resources

After the refactor, Terraform tracked:

- `module.static_site.aws_s3_bucket.this`
- `module.static_site.aws_s3_bucket_public_access_block.this`
- `module.static_site.aws_s3_bucket_versioning.this`

## Final verification

The final Terraform plan returned:

```text
No changes. Your infrastructure matches the configuration.
```

AWS verification confirmed:

- Original dev bucket still exists
- Bucket name is unchanged
- All five tags remain
- All four public-access settings remain enabled
- Versioning remains enabled
- Production resources were unchanged

## Lessons learned

- Terraform modules organize reusable infrastructure configuration.
- Resource addresses change when resources move into a module.
- Moved blocks preserve resource identity during refactoring.
- A safe refactor plan should show zero additions, changes, and destroys.
- Existing tags and resource settings must be preserved exactly.
- Development resources should be refactored and validated before production infrastructure.
