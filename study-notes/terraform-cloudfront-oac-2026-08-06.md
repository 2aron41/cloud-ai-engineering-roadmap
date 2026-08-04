# Terraform CloudFront + OAC Notes

## What is Origin Access Control?

Origin Access Control, or OAC, allows CloudFront to authenticate requests sent to an AWS origin such as a private S3 bucket.

For this static-site design, CloudFront uses signed AWS Signature Version 4 requests when retrieving objects from S3.

The S3 bucket policy can then permit read access only when the request comes from the intended CloudFront distribution.

## Why should CloudFront use OAC instead of making S3 public?

OAC allows the S3 bucket to remain private while CloudFront serves the website publicly.

This preserves S3 Block Public Access and prevents visitors from bypassing CloudFront through a public S3 endpoint.

It also allows the bucket policy to restrict access to:

- The CloudFront service principal
- The required `s3:GetObject` action
- Objects inside the intended bucket
- The intended CloudFront distribution ARN

## Why should CloudFront resources be disabled by default at first?

CloudFront resources should be disabled by default so existing module users do not create global infrastructure accidentally.

This allows:

- Existing S3 environments to remain unchanged
- Resource logic to be reviewed incrementally
- Mocked tests to run before real AWS testing
- CloudFront outputs to be introduced safely
- Production to remain untouched
- CloudFront to require an explicit opt-in decision

## What does `count = var.enable_cloudfront ? 1 : 0` do?

The expression controls how many instances of the resource Terraform creates.

When `enable_cloudfront` is `true`, the resource count is `1`.

When `enable_cloudfront` is `false`, the resource count is `0`, so Terraform does not create that resource.

The Day 21 implementation uses this pattern for:

- Origin Access Control
- CloudFront distribution
- S3 bucket policy
- The policy document used by the bucket policy

## Why should outputs return null when CloudFront is disabled?

When CloudFront is disabled, there is no distribution ID, distribution domain name, or OAC ID to return.

Returning `null` gives callers a clear and safe indication that the optional feature is inactive.

It also avoids referencing a nonexistent resource instance.

## What could go wrong with an S3 bucket policy for CloudFront?

An incorrect bucket policy could:

- Make the bucket or objects public
- Allow the wrong CloudFront distribution
- Grant broader S3 permissions than required
- Use the wrong bucket ARN
- Use an incorrect service principal
- Fail to restrict access with the distribution source ARN
- Block CloudFront from reading the website
- Conflict with S3 Block Public Access expectations

The planned policy grants only `s3:GetObject` to the CloudFront service principal and restricts access to the intended distribution ARN.

## Why should the real dev plan show no changes today?

The real dev module call does not set `enable_cloudfront`, so the variable uses its default value of `false`.

That should result in:

- Zero OAC resources
- Zero CloudFront distributions
- Zero CloudFront S3 bucket policies
- Null CloudFront outputs
- No changes to the existing S3 infrastructure

The actual Day 21 dev plan could not be produced because AWS credentials were unavailable before backend and provider initialization.

## Why should production remain untouched?

Production CloudFront, OAC, S3 policy, IAM, certificates, DNS, and state are not fully modeled or imported.

Mocked tests prove disabled module logic, but they do not prove that the module matches the existing production architecture.

Production should remain untouched until:

- The real resource inventory is complete
- Terraform code matches the existing resources
- Import commands are prepared
- State is backed up
- Stop conditions are defined
- Rollback procedures are tested
- A reviewed plan shows no unsafe changes
