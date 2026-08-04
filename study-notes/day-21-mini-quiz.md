# Day 21 Mini Quiz

## 1. Why is CloudFront added behind a feature flag?

CloudFront is behind `enable_cloudfront` so existing module users do not create new global infrastructure accidentally.

The feature flag allows CloudFront, OAC, the bucket policy, and related outputs to remain inactive until explicitly enabled.

## 2. What does OAC allow CloudFront to do?

Origin Access Control allows CloudFront to authenticate requests to a private S3 origin using AWS Signature Version 4.

This lets the bucket remain private while CloudFront retrieves and serves the website files.

## 3. Why should the S3 bucket remain private?

The bucket should remain private so users cannot bypass CloudFront and access content directly through S3.

This preserves S3 Block Public Access, HTTPS delivery, caching, and the intended CloudFront-only access model.

## 4. Why is CloudFront considered a global resource?

CloudFront distributes content through a global network of edge locations rather than being confined to a single AWS Region.

Its configuration can affect website delivery across all locations used by the distribution.

## 5. Why should the real dev plan show no changes today?

The dev module call does not enable CloudFront, so `enable_cloudfront` remains `false`.

Terraform should therefore create zero OAC, CloudFront, and CloudFront bucket-policy resources while leaving the existing S3 infrastructure unchanged.

The Day 21 plan could not be completed because AWS credentials were unavailable.

## 6. What does a null CloudFront output mean?

A `null` CloudFront output means the optional CloudFront feature is disabled and no distribution or OAC resource exists for that output.

## 7. What would make you stop before applying?

Stop if Terraform proposes unexpected CloudFront, OAC, or bucket-policy creation, S3 replacement, resource destruction, public access, weaker security controls, or any production change.

## 8. Why should mocked tests run before real AWS testing?

Mocked tests can verify configuration logic, disabled-resource counts, outputs, defaults, and validation without contacting AWS or creating infrastructure.

This reduces risk before running a real plan.

## 9. Why is a bucket policy risky?

A bucket policy controls who can access S3 objects.

An incorrect policy could make content public, allow the wrong CloudFront distribution, grant excessive permissions, or prevent the intended distribution from reading the website.

## 10. Why is production import still blocked?

Production import remains blocked because the existing production resources are not fully modeled, matched to Terraform code, backed up, or covered by reviewed import and rollback procedures.

Passing disabled-state mocked tests does not prove that the Terraform configuration safely matches production.
