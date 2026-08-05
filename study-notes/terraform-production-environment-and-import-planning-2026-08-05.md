# Terraform Production Environment and Import Planning Notes — August 5, 2026

## Why create a separate production environment?

A separate production environment keeps production configuration, variables, outputs, and future state isolated from development.

This reduces cross-environment risk and makes it easier to review production-specific differences before any import or apply.

## Why was the production backend left disabled?

The production backend was intentionally left as `backend.tf.example`.

This prevents accidental initialization of production state before the configuration, remote-state key, variables, import order, backups, and stop conditions are fully reviewed.

## Why was no real production terraform.tfvars created?

A real `terraform.tfvars` could make the production configuration immediately usable. During Day 26, the goal was planning rather than execution.

The example file documents expected production values without enabling accidental production plans or imports.

## Why were CloudFront allowed methods made configurable?

The development distribution allows `GET`, `HEAD`, and `OPTIONS`, while the existing production distribution allows only `GET` and `HEAD`.

Making the setting configurable allows both environments to use the same reusable module without forcing an immediate production change.

## What new tests were added?

The module test suite now verifies:

- Default CloudFront methods remain `GET`, `HEAD`, and `OPTIONS`
- A production-compatible configuration can use only `GET` and `HEAD`
- `PriceClass_All` is accepted for production
- Versioning can remain disabled before import
- Unsupported methods such as `POST` are rejected

The complete test suite passed 10 out of 10 tests.

## Why should production match the existing infrastructure before improvements?

Matching production first separates infrastructure adoption from intentional changes.

After import, each improvement can be proposed through a separate reviewed plan rather than being mixed into the initial state adoption.

## What resources are planned for import?

The production import plan identifies:

- S3 bucket
- S3 Block Public Access configuration
- S3 versioning configuration
- S3 encryption configuration
- CloudFront Origin Access Control
- CloudFront distribution
- S3 bucket policy

The IAM policy document is a data source and is not imported.

## Why should imports be performed one resource at a time?

Importing one resource at a time allows the Terraform state binding and resource details to be verified immediately.

This makes mistakes easier to detect and correct than importing all resources through one large command block.

## What is the rollback concept for a wrong import?

Terraform import changes state bindings and normally does not modify the live AWS resource.

If a resource is imported at the wrong address, the corrective approach is a reviewed `terraform state rm` operation after backing up the state.

`terraform destroy` must not be used as an import rollback method.

## What safety conditions remain in place?

- No active production `backend.tf`
- No real production `terraform.tfvars`
- No production `.terraform` directory
- No production Terraform state
- No production imports
- No production plan
- No production apply
- Development state unchanged
- Production AWS resources unchanged
