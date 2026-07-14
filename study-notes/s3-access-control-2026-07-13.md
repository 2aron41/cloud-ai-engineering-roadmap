# S3 Access Control Notes — July 13, 2026

## What Is an S3 Bucket?

An Amazon S3 bucket is a container used to store files and other data in AWS.

A bucket:

- Has a globally unique name.
- Is created in an AWS Region.
- Contains objects.
- Can have permissions, encryption, versioning, and lifecycle settings.

For the portfolio project, the bucket stores the website files used by CloudFront.

## What Is an S3 Object?

An S3 object is an individual file stored inside a bucket.

Examples from the portfolio project:

- `index.html`
- `styles.css`

Each object includes:

- The file data.
- An object key, which works like its name or path.
- Metadata.
- Permissions and encryption information.

## What Does Block Public Access Mean?

S3 Block Public Access is a safety control that prevents a bucket or its objects from accidentally becoming publicly accessible.

For the portfolio bucket, Block Public Access remains enabled because visitors should not access the files directly through S3.

The direct S3 object URL returning `Access Denied` confirms that public access is blocked.

## What Does a Bucket Policy Do?

A bucket policy is a resource-based permissions document attached to an S3 bucket.

It defines:

- Who can access the bucket.
- Which actions they may perform.
- Which objects or paths they may access.
- Conditions that must be satisfied.

For this project, the bucket policy permits the CloudFront distribution to read website objects while continuing to block direct public access.

## Why Is Public Write Access Dangerous?

Public write access could allow anyone on the internet to:

- Upload malicious files.
- Replace legitimate website files.
- Delete or overwrite content.
- Use the bucket for unauthorized storage.
- Increase AWS usage and charges.
- Damage the website or the account's reputation.

A public portfolio website never needs anonymous users to have permission to upload or modify files.

## How Can CloudFront Serve Files While S3 Stays Private?

CloudFront uses Origin Access Control, or OAC, to make authenticated requests to the private S3 bucket.

The request flow is:

```text
Visitor
   |
   | HTTPS
   v
CloudFront
   |
   | Authenticated request using OAC
   v
Private S3 bucket
