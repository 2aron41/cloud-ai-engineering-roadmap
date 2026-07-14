# CloudFront Cache and Invalidation Notes — July 14, 2026

## What Is CloudFront Caching?

CloudFront stores copies of website files at edge locations.

When a visitor requests a file, CloudFront can return the cached copy instead of retrieving the file from the S3 origin every time.

Caching can:

- Reduce load on the origin.
- Improve website speed.
- Reduce latency for visitors in different locations.
- Reduce repeated origin requests.

## What Is an Edge Location?

An edge location is part of CloudFront’s global delivery network.

CloudFront uses edge locations to place content closer to visitors.

## What Is the Origin?

The origin is the source where CloudFront retrieves the original files.

For this portfolio:

```text
Origin: Private Amazon S3 bucket
Public entry point: Amazon CloudFront
