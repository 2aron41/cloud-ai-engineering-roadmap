# Day 25 Mini Quiz — August 5, 2026

## 1. Why should existing production resources be inventoried before Terraform import?

The inventory establishes the real production configuration, dependencies, security settings, and resource identities so Terraform can be configured without guessing.

## 2. What production resources were identified?

A private S3 bucket, a CloudFront distribution, an Origin Access Control, and an S3 bucket policy were identified.

## 3. What proves that the production S3 bucket is private?

All four Block Public Access settings are enabled, the policy status reports `IsPublic` as `false`, and direct S3 access returns `403 Forbidden`.

## 4. What proves that the production website is working?

The production CloudFront URL returns `HTTP/2 200` and serves the HTML content successfully.

## 5. Does production use OAC or OAI?

Production uses Origin Access Control. The legacy Origin Access Identity field is empty.

## 6. What are the production OAC signing settings?

The signing behavior is `always`, the signing protocol is `sigv4`, and the origin type is `s3`.

## 7. Name two production settings that differ from the development module.

Examples include CloudFront price class, allowed HTTP methods, S3 versioning, bucket tags, and the bucket-policy condition operator.

## 8. Why is a separate production Terraform state necessary?

It prevents production and development resources from being managed together and reduces the chance of cross-environment changes.

## 9. Why should production usually be matched before improvements are introduced?

Matching the current configuration first reduces unexpected post-import changes. Improvements can then be made separately through reviewed plans.

## 10. What would cause the production import process to stop?

Stop if Terraform proposes replacing or destroying the production S3 bucket, CloudFront distribution, OAC, website content, or unrelated resources, or if it mixes production into development state.
