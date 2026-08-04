# Day 22 Mini Quiz

## 1. Why did Day 21 need a real dev plan after mocked tests passed?

Mocked tests proved module logic without contacting AWS, but the real dev plan compared the current configuration with remote state and actual development infrastructure.

That was necessary to prove the disabled CloudFront/OAC skeleton caused no real changes.

## 2. What does `terraform init` need AWS credentials for when using an S3 backend?

Terraform needs AWS credentials to authenticate to the S3 backend, read remote state, initialize providers, and prepare the working directory for validation and planning.

## 3. What result proves disabled CloudFront resources are not affecting dev?

The safe result is:

`No changes. Your infrastructure matches the configuration.`

The plan must also show no CloudFront, OAC, or S3 bucket-policy resources.

## 4. Why should `terraform apply` not be run today?

Today’s goal was verification, not infrastructure creation.

A clean plan already proved the disabled skeleton is inactive, so there was no approved change to apply.

## 5. What would make you stop immediately during the plan review?

Stop if Terraform proposes:

- CloudFront creation
- OAC creation
- S3 bucket-policy creation
- S3 replacement
- Resource destruction
- Public-access changes
- Production changes

## 6. Why is OAC safer than making the S3 bucket public?

OAC lets CloudFront retrieve objects through authenticated signed requests while the S3 bucket remains private.

The bucket policy can restrict access to the intended CloudFront distribution instead of allowing public access.

## 7. What does `enable_cloudfront = false` protect against?

It prevents the module from creating CloudFront, OAC, and the CloudFront bucket policy unless the feature is explicitly enabled.

This protects existing S3 environments from unexpected global-resource changes.

## 8. Why should production imports remain blocked?

Production resources are not fully inventoried, modeled, backed up, imported, or covered by reviewed rollback procedures.

A clean disabled-state dev plan does not prove production import safety.

## 9. What is the difference between mocked module tests and a real dev plan?

Mocked tests verify Terraform logic, validation, resource counts, and outputs without contacting AWS.

A real dev plan authenticates to AWS, reads remote state, refreshes actual resources, and compares the configuration with real infrastructure.

## 10. What evidence should be saved before enabling CloudFront in dev?

Save:

- Verified AWS identity and region
- Successful backend initialization
- Passing validation and tests
- Clean disabled-state dev plan
- Expected enabled-resource plan
- Stop conditions
- Cost expectations
- No-destroy and no-replacement confirmation
- Evidence that production remains untouched
