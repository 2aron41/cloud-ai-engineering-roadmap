# Terraform Dev CloudFront/OAC Notes — August 4, 2026

## Why enable CloudFront in dev before production?

Development isolates risk. It allowed the Terraform configuration, OAC permissions, private S3 bucket policy, deployment behavior, and content delivery to be verified without changing the live production portfolio.

## What resources did Terraform plan to create?

Terraform reported `3 to add, 0 to change, 0 to destroy`.

The resources were:

- `module.static_site.aws_cloudfront_distribution.this[0]`
- `module.static_site.aws_cloudfront_origin_access_control.this[0]`
- `module.static_site.aws_s3_bucket_policy.cloudfront[0]`

## What does Origin Access Control do?

OAC allows CloudFront to authenticate requests to the private S3 origin with AWS Signature Version 4. Visitors use CloudFront while direct anonymous S3 access remains blocked.

## Why does the S3 bucket policy matter?

The policy allows CloudFront to perform `s3:GetObject` on the private bucket and restricts access to the intended distribution instead of making the bucket public.

## Why should the bucket remain private?

A private bucket prevents users from bypassing CloudFront. CloudFront remains the public HTTPS entry point and can provide caching, monitoring, and future security controls.

## What plan result was safe?

The safe result was `3 to add, 0 to change, 0 to destroy`, containing only the expected dev CloudFront distribution, OAC, and bucket policy.

## What plan result would have made me stop?

I would have stopped for any destroy action, S3 replacement, public-access change, encryption or versioning removal, IAM or DNS change, production change, or unexpected resource.

## How did I verify production was unchanged?

All commands were run from `infra/environments/dev`, using the dev remote-state key. The plan contained only development resource addresses, and no production Terraform commands were run.

## Why should production import still wait?

Production needs its own inventory, state backup, import map, drift review, rollback procedure, no-destroy approval gate, and validation plan.

## Verified Results

- CloudFront distribution: `EBPB0D0F7AVMX`
- CloudFront domain: `d2z14ubddi45aa.cloudfront.net`
- CloudFront status: `Deployed`
- OAC: `E36HY1D4F1XHZC`
- S3 bucket policy: Present in Terraform state
- Final Terraform plan: No changes
- Initial CloudFront response: `HTTP/2 403`
- Final CloudFront response: `HTTP/2 200`
- Test object encryption: `AES256`
- Dev bucket remained private: Yes
- Duplicate interrupted distribution: None
- Production resources changed: No
