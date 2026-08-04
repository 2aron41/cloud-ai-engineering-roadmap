# Terraform CloudFront Resource Notes

## What Terraform resource manages a CloudFront distribution?

The `aws_cloudfront_distribution` resource manages a CloudFront distribution.

It defines settings such as:

- Origins
- Default cache behavior
- Allowed and cached methods
- Viewer protocol policy
- Default root object
- Price class
- Viewer certificate
- Restrictions
- Logging
- Tags

## What Terraform resource manages Origin Access Control?

The `aws_cloudfront_origin_access_control` resource manages CloudFront Origin Access Control.

For an S3 origin, the planned configuration should use:

- Origin type: `s3`
- Signing behavior: `always`
- Signing protocol: `sigv4`

This allows CloudFront to send authenticated requests to the private S3 bucket.

## What Terraform resource manages an S3 bucket policy?

The `aws_s3_bucket_policy` resource attaches a policy to the S3 bucket.

The policy can be generated with an `aws_iam_policy_document` data source so the permissions, principals, resources, and conditions are easier to review.

The future policy should:

- Allow only the required object-read permission
- Use the CloudFront service principal
- Restrict access to the intended CloudFront distribution ARN
- Avoid public principals
- Avoid unnecessary permissions

## What output does GitHub Actions need for CloudFront invalidation?

GitHub Actions needs the CloudFront distribution ID.

The deployment workflow uses the distribution ID when running a command such as:

`aws cloudfront create-invalidation`

The distribution domain name is useful for validation and documentation, but the distribution ID is the value required to create an invalidation.

## What S3 value should CloudFront use as the origin?

CloudFront should use the S3 bucket regional domain name.

The module already exposes this value through:

`bucket_regional_domain_name`

This represents the private S3 REST endpoint used with Origin Access Control.

## Why should CloudFront use the S3 regional domain name instead of public website hosting?

The S3 website endpoint requires the public website-hosting access model and does not support Origin Access Control.

Using the regional S3 domain name allows CloudFront to access the private bucket through authenticated signed requests while S3 Block Public Access remains enabled.

This preserves the architecture:

CloudFront public entry point → authenticated OAC request → private S3 origin

## What is the default root object?

The default root object is the file CloudFront returns when a visitor requests the root path without specifying a file.

For this portfolio, the planned default is:

`index.html`

Without a default root object, a request to the distribution root may not automatically return the portfolio homepage.

## What is viewer protocol policy?

Viewer protocol policy controls how CloudFront handles HTTP and HTTPS requests from website visitors.

Common values include:

- `allow-all`
- `https-only`
- `redirect-to-https`

The planned setting should be `redirect-to-https` so HTTP requests are redirected to HTTPS.

## What is price class?

CloudFront price class controls which groups of edge locations the distribution may use.

Common values include:

- `PriceClass_100`
- `PriceClass_200`
- `PriceClass_All`

A broader price class can provide wider global edge coverage but may increase delivery cost. The current placeholder default is `PriceClass_100`.

## What could break if the origin settings are wrong?

Incorrect origin settings could cause:

- CloudFront receiving access-denied responses from S3
- The website returning errors or missing files
- OAC not signing requests correctly
- CloudFront pointing to the wrong bucket
- The bucket policy allowing the wrong distribution
- Direct public S3 access becoming necessary
- Cache behavior using the wrong origin
- The live portfolio becoming unavailable

Origin changes must be tested outside production and reviewed carefully before any production import or apply.
