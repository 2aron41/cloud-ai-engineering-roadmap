# Day 23 Mini Quiz

## 1. Why did we enable CloudFront only in dev?

To isolate deployment risk and verify the Terraform configuration, OAC permissions, private S3 bucket policy, and content delivery before considering production changes.

## 2. What three resources were expected in the plan?

- `module.static_site.aws_cloudfront_distribution.this[0]`
- `module.static_site.aws_cloudfront_origin_access_control.this[0]`
- `module.static_site.aws_s3_bucket_policy.cloudfront[0]`

## 3. Why is OAC safer than public S3 access?

OAC lets CloudFront authenticate securely to the private S3 origin while direct anonymous access to the bucket remains blocked.

## 4. What does the S3 bucket policy allow CloudFront to do?

It allows the CloudFront service to perform `s3:GetObject` against objects in the private bucket and restricts that access to the intended CloudFront distribution.

## 5. Why should a saved plan be applied instead of a new unchecked plan?

A saved plan ensures Terraform applies the exact actions that were reviewed. A newly calculated plan could differ if the configuration, state, or real infrastructure changed.

## 6. Why is `0 to destroy` important?

It confirms that enabling CloudFront will not delete existing infrastructure, including the development S3 bucket.

## 7. Why should production still not be imported today?

Production requires its own resource inventory, state backup, import map, drift review, rollback procedure, no-destroy approval gate, and validation plan.

## 8. What evidence proves the dev apply was safe?

The reviewed plan showed:

```text
Plan: 3 to add, 0 to change, 0 to destroy.
```

Only the expected development CloudFront distribution, OAC, and S3 bucket policy were proposed.

## 9. What evidence proves the final state matches the code?

The final Terraform plan reported:

```text
No changes. Your infrastructure matches the configuration.
```

Terraform state also contained the CloudFront distribution, OAC, and S3 bucket policy.

## 10. What should be documented before production migration?

The production resource inventory, state backup, Terraform addresses, import commands, expected post-import plan, stop conditions, drift findings, rollback procedure, security checks, and content-delivery verification should all be documented.
