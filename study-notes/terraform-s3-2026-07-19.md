# Terraform S3 Notes

## What Terraform resource creates an S3 bucket?

The `aws_s3_bucket` resource creates and manages an Amazon S3 bucket.

## What resource controls S3 public access block settings?

The `aws_s3_bucket_public_access_block` resource controls the four bucket-level S3 Block Public Access settings:

- `block_public_acls`
- `block_public_policy`
- `ignore_public_acls`
- `restrict_public_buckets`

All four settings were enabled for the Day 11 dev bucket.

## Why should dev and production resources be separate?

Dev and production resources should remain separate so that experiments, configuration mistakes, state problems, and destructive actions do not affect the live portfolio.

The Day 11 bucket used a dev-only name, dev tags, and a Terraform precondition that requires the environment to equal `dev`.

## Why should bucket names be globally unique?

Amazon S3 bucket names use a shared global namespace. A bucket name must be unique across AWS accounts within the applicable AWS partition.

Using `bucket_prefix` allowed Terraform to generate a unique suffix while preserving the intended project naming pattern.

## Why should production resources not be imported casually?

Importing connects an existing production resource to Terraform state. An incomplete or inaccurate Terraform configuration could then propose unexpected changes, replacements, or deletions.

Production resources should only be imported after their configuration, dependencies, state strategy, and recovery plan are understood.

## What did the Terraform plan show before apply?

The reviewed plan showed exactly three resources to create:

- `aws_s3_bucket.dev`
- `aws_s3_bucket_public_access_block.dev`
- `aws_s3_bucket_versioning.dev`

The final plan summary was:

`3 to add, 0 to change, 0 to destroy`

The plan did not include the production S3 bucket, CloudFront distribution, Origin Access Control, IAM role, or website files.

## How did I confirm the apply worked?

I confirmed the apply through several checks:

- Terraform reported `3 added, 0 changed, 0 destroyed`.
- `terraform state list` showed only the three expected dev resources.
- A post-apply `terraform plan` reported no changes.
- AWS confirmed that the dev bucket exists in `us-east-1`.
- All four public-access settings were enabled.
- Versioning was enabled.
- The required tags were present.
- S3 website hosting was not configured.

## What would make me stop before applying?

I would stop if:

- The plan included a production resource.
- The plan proposed a destroy, replacement, or unexpected update.
- More resources appeared than expected.
- Any public-access protection was disabled.
- Website hosting or a public bucket policy appeared.
- The authenticated AWS account or IAM identity was incorrect.
- The Terraform plan failed.
- The state location or backup strategy was unclear.
- I did not fully understand every planned action.
