# Day 20 Mini Quiz

## 1. Why should CloudFront be planned before being added to Terraform?

CloudFront should be planned first because it affects the live website request path and depends on several connected settings, including the S3 origin, Origin Access Control, bucket policy, cache behavior, HTTPS, certificates, and GitHub Actions invalidation.

Planning makes those relationships and risks visible before infrastructure is created or changed.

## 2. Why is CloudFront riskier than adding S3 encryption?

S3 encryption is a narrow bucket-level configuration change. CloudFront affects how users reach the website, how content is cached, how HTTPS is handled, and whether CloudFront can access the private S3 origin.

An incorrect CloudFront change could cause website downtime or break the connection between CloudFront and S3.

## 3. What does Origin Access Control allow?

Origin Access Control allows CloudFront to authenticate requests to a private S3 origin using signed AWS Signature Version 4 requests.

The S3 bucket policy can then restrict object access to the intended CloudFront distribution.

## 4. Why should the S3 bucket stay private?

The bucket should remain private so visitors access the portfolio through CloudFront instead of bypassing it through S3.

This preserves HTTPS delivery, caching, CloudFront access controls, and S3 Block Public Access.

## 5. What value does GitHub Actions need to invalidate CloudFront?

GitHub Actions needs the CloudFront distribution ID.

The deployment workflow uses that ID when creating a CloudFront cache invalidation after website files are deployed.

## 6. What does `default_root_object` control?

It controls which object CloudFront returns when a visitor requests the distribution root without including a file name.

For the portfolio, the planned value is `index.html`.

## 7. What does CloudFront price class affect?

Price class controls which groups of CloudFront edge locations the distribution can use.

A broader price class may provide wider global coverage but can increase delivery cost.

## 8. Why should placeholder variables be tested before resources are added?

Testing the variables first proves that defaults and validation rules behave correctly before they are connected to infrastructure resources.

This reduces the number of unknowns when CloudFront resources are eventually introduced.

## 9. Why should production import still wait?

Production import should wait because the CloudFront distribution, OAC, S3 bucket policy, IAM resources, import commands, expected plan, state backup process, and rollback procedure are not fully modeled and verified.

Placeholder variables and mocked tests do not prove the live production configuration matches Terraform.

## 10. What plan result would make you stop immediately?

Stop if Terraform proposes unexpected destruction, replacement, public S3 access, OAC removal, bucket-policy weakening, certificate or DNS changes, broader IAM permissions, or an unexplained CloudFront origin or cache-behavior change.
