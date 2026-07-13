# AWS S3 and CloudFront Recall — 2026-07-12

## S3

My answer:
S3 is mainly used for storing objects and files such as images, PDFs, logs, backups, and website files.

Confidence: High

After checking:
- Correct: S3 is object storage.
- Missing: Objects include the file plus metadata.
- Correction: S3 stores objects inside buckets.

## S3 Bucket

My answer:
An S3 bucket is a container for objects.

Confidence: High

After checking:
- Correct: Buckets hold S3 objects.
- Missing: Bucket names must be unique across AWS.
- Correction: A bucket is the top-level container where S3 objects are stored.

## S3 Object

My answer:
An S3 object is a file stored in S3 plus metadata.

Confidence: Medium

After checking:
- Correct: Objects include the file/data and metadata.
- Missing: Objects also have keys, which act like names/paths.
- Correction: An S3 object is the actual data stored in a bucket, plus metadata and an object key.

## Static Website Hosting

My answer:
Static website hosting means hosting website files like HTML, CSS, JavaScript, images, and PDFs without needing backend server code.

Confidence: Medium

After checking:
- Correct: Static sites are made from files.
- Missing: No server-side processing is needed.
- Correction: Static website hosting serves fixed files directly to users.

## Public Access in S3

My answer:
Public access means people on the internet can access the bucket or objects.

Confidence: Medium

After checking:
- Correct: Public access allows internet access.
- Missing: Public access can apply at bucket or object level.
- Correction: Public access should be controlled carefully to avoid exposing private files.

## Bucket Policy

My answer:
A bucket policy controls permission rules for an S3 bucket.

Confidence: High

After checking:
- Correct: Bucket policies control access.
- Missing: Bucket policies are written in JSON.
- Correction: A bucket policy is a JSON permissions document attached to a bucket.

## CloudFront

My answer:
CloudFront is AWS’s content delivery network.

Confidence: High

After checking:
- Correct: CloudFront is a CDN.
- Missing: It caches and delivers content through edge locations.
- Correction: CloudFront delivers content faster and securely by caching it closer to users.

## Edge Location

My answer:
An edge location is an AWS location closer to users.

Confidence: High

After checking:
- Correct: Edge locations reduce latency.
- Missing: They are used by CloudFront to cache content.
- Correction: Edge locations help deliver content faster by storing copies closer to users.

## Caching

My answer:
Caching means copying files or content temporarily so they load faster.

Confidence: Medium

After checking:
- Correct: Caching stores temporary copies.
- Missing: Cached content can reduce load on the origin.
- Correction: Caching stores copies of content closer to users to improve speed and reduce repeated origin requests.

## HTTPS

My answer:
HTTPS is an encrypted website connection.

Confidence: High

After checking:
- Correct: HTTPS encrypts traffic.
- Missing: HTTPS helps build trust and protects visitors.
- Correction: HTTPS secures communication between the user and the website.

## Custom Domain

My answer:
A custom domain is your own website name.

Confidence: Medium

After checking:
- Correct: A custom domain is a human-readable website address.
- Missing: It can point to AWS services through DNS.
- Correction: A custom domain is a personalized domain name such as `yourname.com`.

## S3 Standard vs S3 Glacier

My answer:
S3 Standard is for active files that need fast access. S3 Glacier is for cheaper archive storage with slower retrieval.

Confidence: High

After checking:
- Correct: Standard is for active access and Glacier is for archives.
- Missing: Glacier should not be used for active website files.
- Correction: Active website files should use S3 Standard, not S3 Glacier.

## Future Portfolio Architecture

My answer:
S3 will store the portfolio files. CloudFront will deliver the portfolio faster and securely.

Confidence: High

After checking:
- Correct: S3 stores and CloudFront delivers.
- Missing: CloudFront also helps support HTTPS and caching.
- Correction: S3 stores HTML, CSS, JavaScript, images, and resume files. CloudFront delivers them through edge locations with caching and HTTPS support.

