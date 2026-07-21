# Terraform Import vs. Recreate — July 18, 2026

## Why This Decision Matters

The portfolio infrastructure already exists in AWS, but Terraform does not currently manage it. Terraform must not assume ownership until the configuration and state strategy are understood.

## Terraform Import

Terraform import associates an existing AWS resource with a Terraform resource address in state.

Import does not automatically guarantee that the written Terraform configuration matches the live resource. After importing, the configuration and plan must be reviewed carefully for unexpected changes.

## Benefits of Import

- Preserves an existing production resource
- Avoids replacing a working resource
- Allows Terraform to manage the resource after configuration is aligned
- Useful for resources that are difficult or disruptive to recreate

## Risks of Import

- Incorrect Terraform configuration may propose changes to the live resource
- Importing the wrong resource address can create confusing state
- Related resources may need to be imported in a specific order
- Sensitive identifiers may be stored in Terraform state

## Recreating Resources

Recreation means defining a new resource in Terraform and allowing Terraform to create it instead of taking ownership of the existing resource.

## Benefits of Recreation

- Produces a clean Terraform-managed environment from the beginning
- Makes testing safer when performed in a separate dev environment
- Avoids immediately connecting Terraform state to production

## Risks of Recreation

- A production resource could be replaced accidentally
- CloudFront replacement could change the public domain or cause downtime
- S3 replacement could risk website files or access settings
- IAM recreation could break GitHub Actions deployment access

## Current Portfolio Decision

Do not import, recreate, apply, or destroy production resources during Day 10.

First create and understand a harmless dev Terraform configuration. Later, define test resources in the dev environment and compare their behavior with the existing production architecture.

After the dev configuration is proven, decide individually whether each production resource should be imported or recreated.

## Likely Resource Decisions

- S3 bucket: Import may be safer because the bucket already stores live website files.
- CloudFront distribution: Import may be safer because replacing it could change the public endpoint or cause downtime.
- Origin Access Control: Import or recreate only after dependency effects are understood.
- IAM OIDC role and policy: Import may preserve the working GitHub Actions deployment path, but every trust and permission change must be reviewed.

## Safe Migration Sequence

1. Inventory the current AWS resources.
2. Write Terraform for an isolated dev environment.
3. Run `terraform fmt`, `terraform validate`, and `terraform plan`.
4. Test new resources only in dev.
5. Compare Terraform configuration with production.
6. Back up and protect Terraform state.
7. Decide import versus recreation for each resource.
8. Review every production plan before applying.

## Day 10 Safety Result

The dev Terraform skeleton was initialized, formatted, validated, and planned. The plan contained outputs only, created no AWS resources, and produced no Terraform state because `terraform apply` was not run.
