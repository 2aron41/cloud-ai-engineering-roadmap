# Terraform CloudFront Planning Notes

## What problem does CloudFront solve in my portfolio?

CloudFront provides the public HTTPS entry point for the portfolio while the S3 origin remains private. It caches website files at edge locations, improves delivery performance, provides a stable distribution domain, and prevents visitors from needing direct access to the S3 bucket.

## What is an origin?

An origin is the source from which CloudFront retrieves content when the requested object is not already cached. For this portfolio, the origin is the private S3 bucket that stores files such as `index.html`, stylesheets, images, and scripts.

CloudFront retrieves those objects from S3 and then serves them to website visitors.

## What is Origin Access Control?

Origin Access Control, or OAC, allows CloudFront to authenticate requests sent to a private S3 bucket using AWS Signature Version 4.

The S3 bucket policy can then permit object access only when the request comes through the intended CloudFront distribution. This lets the website remain publicly available through CloudFront without making the S3 bucket public.

## Why should the S3 bucket remain private?

The bucket should remain private so users cannot bypass CloudFront and access the website files directly through S3.

Keeping the bucket private:

- Preserves the CloudFront-only access model
- Prevents unintended public S3 access
- Allows the bucket policy to restrict access to the intended distribution
- Keeps HTTPS, caching, and other CloudFront behavior in front of the website
- Reduces the risk of accidental exposure caused by public bucket settings

S3 Block Public Access should remain enabled.

## What Terraform resources might be needed?

### CloudFront distribution:
An `aws_cloudfront_distribution` resource may be needed to define:

- The S3 origin
- The default cache behavior
- Allowed and cached HTTP methods
- Viewer protocol redirection to HTTPS
- Default root object
- Cache or origin request policies
- Price class
- IPv6 settings
- Restrictions
- Viewer certificate settings
- Distribution tags

### Origin Access Control:
An `aws_cloudfront_origin_access_control` resource may be needed to create the authenticated connection between CloudFront and the private S3 origin.

The configuration should use:

- Origin type: S3
- Signing behavior: always
- Signing protocol: SigV4

### S3 bucket policy:
An `aws_s3_bucket_policy` resource or generated IAM policy document may be needed to allow CloudFront to read objects from the private bucket.

The policy should:

- Allow only the required S3 read action
- Identify the CloudFront service principal
- Restrict access to the intended distribution ARN
- Avoid public principals
- Avoid broader permissions than necessary

### CloudFront response/caching settings:
The distribution will need planned settings for:

- Redirecting HTTP requests to HTTPS
- Allowed methods
- Cached methods
- Compression
- Cache policy
- Origin request policy if needed
- Default root object
- Error responses if the single-page site requires them
- Certificate selection
- Geographic restrictions
- Logging if added later

Managed CloudFront policies may be preferable when they meet the portfolio requirements and reduce unnecessary custom configuration.

## Why is CloudFront riskier than the dev S3 bucket?

CloudFront is part of the live website request path. An incorrect change can affect availability, HTTPS behavior, caching, object access, redirects, or the connection between CloudFront and S3.

CloudFront also has more interconnected configuration than a standalone development bucket. It depends on:

- The distribution
- The S3 origin
- Origin Access Control
- The S3 bucket policy
- Cache behavior
- Certificate configuration
- Potential domain and DNS settings
- GitHub Actions deployment and invalidation behavior

A bad CloudFront plan could interrupt the public portfolio even if the S3 files remain intact.

## What could go wrong if CloudFront is imported or changed incorrectly?

Possible failures include:

- Terraform proposing to replace the production distribution
- Website downtime
- CloudFront losing access to S3
- The S3 bucket accidentally becoming public
- The bucket policy permitting the wrong distribution
- Incorrect HTTPS or certificate settings
- Incorrect default root object behavior
- Cache settings serving stale content
- Unexpected geographic or price-class changes
- Custom domain or DNS disruption
- Terraform attempting to remove configuration that exists in AWS but is missing from code

Production changes must stop if the plan contains unexplained replacements, destruction, public access, certificate changes, DNS changes, or access-policy changes.

## Why should CloudFront be modeled in dev or planning first?

Planning first allows the architecture, resource relationships, variables, outputs, and tests to be reviewed before production is involved.

A non-production or mocked-provider workflow can help verify that:

- The distribution references the correct origin
- OAC is enabled
- HTTPS redirection is configured
- The bucket remains private
- The bucket policy is scoped to the intended distribution
- Required tags and settings are present
- Outputs expose useful distribution information

This reduces risk, but mocked tests do not prove that a real production import will be safe. The final production code must still match the existing AWS configuration closely before import.

## What should remain in GitHub Actions?

GitHub Actions should continue handling application deployment operations, including:

- Authenticating to AWS through GitHub OIDC
- Uploading or synchronizing website files to S3
- Deleting obsolete deployed files when intentionally configured
- Creating CloudFront invalidations after content changes
- Running deployment validation checks
- Reporting deployment failures

Terraform should manage infrastructure configuration. It should not upload routine website content or create a CloudFront invalidation on every site deployment.
