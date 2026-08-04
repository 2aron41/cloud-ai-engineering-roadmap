# Day 19 Mini Quiz

## 1. Why is the static-site module ready for dev but not production import yet?

The module is ready for development S3 use because it safely manages a private bucket, Block Public Access, versioning, SSE-S3 encryption, required tags, input validation, outputs, tests, and CI.

It is not ready for production import because the production website also depends on CloudFront, Origin Access Control, the S3 bucket policy, IAM deployment resources, cache behavior, certificates, and rollback procedures that are not yet fully modeled or tested.

## 2. Why is CloudFront riskier to manage than a dev S3 bucket?

CloudFront is part of the live public request path. A bad change could cause downtime, break HTTPS, change caching, prevent CloudFront from reading S3, expose the wrong origin, or affect domain and certificate settings.

A development S3 bucket has a smaller scope and is not serving the live portfolio.

## 3. What does Origin Access Control protect?

Origin Access Control allows CloudFront to authenticate requests to the private S3 origin with Signature Version 4.

Combined with the S3 bucket policy, it prevents direct public access and limits S3 object access to the intended CloudFront distribution.

## 4. Why should the S3 bucket stay private?

The bucket should remain private so visitors must access the website through CloudFront.

This preserves HTTPS, caching, CloudFront access controls, and the intended architecture while reducing the risk of accidental public S3 exposure.

## 5. What should make you stop before a production import?

Stop if the resource inventory is incomplete, the Terraform code does not match AWS, state is not backed up, import identifiers are uncertain, or Terraform proposes unexpected destruction, replacement, public access, encryption removal, OAC removal, IAM weakening, certificate changes, DNS changes, or other unexplained production modifications.

## 6. Why should Terraform code match the existing resource before import?

Import only connects an existing resource to a Terraform state address. It does not automatically generate matching configuration.

If the code differs from the real resource, the next plan may propose changing, replacing, or weakening the production resource.

## 7. Why should state be backed up before import?

A backup provides a recovery point if the wrong resource address is used, state becomes inconsistent, or an import operation is handled incorrectly.

The backup should be stored outside the repository and restored only when necessary and reviewed.

## 8. Why should website uploads remain in GitHub Actions?

Website uploads are application deployment operations, not long-lived infrastructure configuration.

GitHub Actions can authenticate through OIDC, synchronize site files to S3, validate the deployment, and create CloudFront invalidations. Terraform should manage the bucket, distribution, OAC, policies, and other infrastructure resources.

## 9. What does a passing mocked Terraform test prove?

It proves that the Terraform configuration can be initialized, evaluated, validated, and tested against the declared assertions without contacting AWS.

It can prove expected relationships, defaults, validation failures, and planned values. It does not prove that a real AWS deployment or production import will succeed.

## 10. What does a clean dev plan prove?

A clean development plan proves that the current Terraform configuration and development state agree with the real managed development infrastructure at that moment.

It does not prove that production matches the code or that a production import is safe.
