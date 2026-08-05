# Terraform CloudFront/OAC Security Notes — August 5, 2026

## Why does CloudFront need permission to read from S3?

The development S3 bucket is private, so CloudFront cannot retrieve website objects unless the bucket policy explicitly allows it. Origin Access Control lets CloudFront sign its S3 origin requests with AWS Signature Version 4. The S3 bucket policy then authorizes those signed requests from the CloudFront service principal.

## Why should the bucket policy restrict access to the CloudFront distribution ARN?

Restricting access with an `AWS:SourceArn` condition limits the permission to one specific CloudFront distribution. Without this condition, another CloudFront distribution could potentially attempt to use the same permission.

The restriction supports least privilege because the policy grants access only to the intended development distribution.

## Why is `s3:GetObject` enough for website delivery?

CloudFront only needs to retrieve website files such as HTML, CSS, JavaScript, and images from S3. The `s3:GetObject` action provides read access to those objects.

CloudFront does not need permission to upload, delete, modify, or manage objects for normal static website delivery.

## Why should public write access never be allowed?

Public write access could allow unauthorized users to upload, replace, or delete website content. This could lead to website defacement, malware distribution, data loss, unexpected costs, or account abuse.

Website deployment writes should occur only through controlled identities and approved deployment workflows.

## Why is OAC better than making S3 public?

OAC allows CloudFront to retrieve private S3 objects through signed requests. The bucket can keep all four Block Public Access settings enabled while CloudFront still serves the website.

Making S3 public would expose the origin directly and would remove an important security boundary.

## What does a final no-change plan prove?

A final no-change Terraform plan proves that Terraform did not detect differences between the current configuration, remote state, and live resources at the time of the plan.

It does not prove that the architecture is perfectly secure, but it provides evidence that the reviewed configuration matches the deployed development infrastructure.

## Why is a rollback plan needed before production migration?

A rollback plan defines the expected removal sequence, safety checks, and stop conditions before a failure occurs. It reduces the chance of making rushed or destructive decisions during cleanup or recovery.

The plan also clarifies which resources may be removed and which resources, such as the S3 bucket and production infrastructure, must remain untouched.

## Why should production remain untouched?

The module is still being tested and hardened in development. Production migration introduces greater risk because existing resources may contain live content, DNS dependencies, deployment workflows, and manually created settings.

Development verification, testing, documentation, rollback planning, and import planning should be completed before production resources are considered.
