# Terraform Production Import Drift Reduction Notes — August 5, 2026

## Why reduce import drift before production import?

Terraform should model the existing production infrastructure as closely as practical before resources are imported.

Reducing known differences makes the first post-import plan easier to understand and lowers the risk of mixing infrastructure adoption with unrelated configuration changes.

## Which production differences became configurable?

The module now supports production-specific values for:

- CloudFront allowed methods
- CloudFront price class
- CloudFront comment
- CloudFront origin ID
- Origin Access Control name
- Origin Access Control description
- S3 bucket-policy SourceArn condition operator

Development retains safe defaults while production can represent the live configuration more closely.

## Why must an empty CloudFront comment be preserved?

The existing production distribution has an empty comment.

Terraform must distinguish between:

- `null`, meaning use the module-generated default
- an empty string, meaning preserve the explicitly empty production comment

Using `coalesce()` was not appropriate for this case because it treated the empty string as a missing value. A null check now preserves explicit empty strings.

## Why was the CloudFront origin assertion changed?

Terraform represents the CloudFront `origin` block as a set of objects rather than an indexable list.

The test therefore uses a `for` expression and `one()` to retrieve the single configured origin ID instead of indexing it with `[0]`.

## Why is the bucket-policy condition operator configurable?

Development uses `StringEquals`, while the existing production bucket policy uses `ArnLike`.

Both restrict access using the CloudFront distribution ARN, but matching the existing operator reduces unnecessary policy drift immediately after import.

## What validation was added?

The module rejects:

- Unsupported SourceArn condition operators
- Empty CloudFront origin IDs
- Empty OAC names
- Unsupported CloudFront HTTP methods

These checks prevent invalid or ambiguous configurations from reaching a production plan.

## What production-compatible behavior is now tested?

The Terraform tests verify:

- Production allows only `GET` and `HEAD`
- Production uses `PriceClass_All`
- Versioning remains disabled before import
- An explicitly empty CloudFront comment is preserved
- The configured production origin ID is used by both the origin and cache behavior
- The configured OAC name is preserved
- The configured OAC description is preserved
- The production SourceArn condition operator is `ArnLike`

## How many tests now pass?

The module test suite contains 13 passing tests and 0 failures.

GitHub Actions also passed the same Terraform test workflow.

## What differences remain?

The largest known unresolved design difference is tagging.

Existing production resources currently have no tags, while the module requires standard tags.

Provider normalization, S3 versioning behavior, and other differences may only become visible after controlled state import and refresh.

## What remained disabled?

- No active production backend
- No real production `terraform.tfvars`
- No production `.terraform` directory
- No production state
- No production imports
- No production plan
- No production apply
