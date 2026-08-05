# Day 24 Mini Quiz — August 5, 2026

## 1. What does OAC allow CloudFront to do?

OAC allows CloudFront to sign requests to the private S3 origin using AWS Signature Version 4 so S3 can authenticate and authorize the requests.

## 2. Why should the S3 bucket policy include a SourceArn condition?

The `AWS:SourceArn` condition limits the permission to the intended CloudFront distribution instead of broadly trusting requests associated with other distributions.

## 3. Why should the policy allow only `s3:GetObject`?

Static website delivery requires CloudFront to read objects. It does not require CloudFront to upload, delete, modify, or administer S3 content.

## 4. What proves the S3 bucket is still private?

All four S3 Block Public Access settings are enabled, the bucket policy status reports `IsPublic` as `false`, and a direct request to the S3 object returns `403 Forbidden`.

## 5. What proves CloudFront can still serve content?

An HTTPS request to the CloudFront domain returns `HTTP/2 200` with the expected HTML content type.

## 6. Why should the dev CloudFront rollback plan be written before production migration?

It defines the safe removal method and stop conditions before production risk is introduced. It also proves that cleanup has been considered without performing an unnecessary destroy.

## 7. What would make you stop during a rollback plan review?

Stop if Terraform proposes destroying or replacing the S3 bucket, touching production, changing IAM or DNS, making S3 public, or modifying unrelated resources.

## 8. Why do mocked tests not replace real AWS verification?

Mocked tests can validate Terraform configuration and planned resource attributes, but they cannot prove that the deployed distribution is active, HTTPS works, the live bucket policy is correct, or direct S3 access is blocked.

## 9. What does a final no-change Terraform plan prove?

It proves that Terraform found no differences between the reviewed configuration, remote state, and live development infrastructure at the time the plan ran.

## 10. Why should production still not be imported yet?

The development implementation is still being tested, documented, and prepared for migration. Production import should wait until resource inventories, import commands, rollback procedures, state safety, and expected plans have been fully reviewed.
