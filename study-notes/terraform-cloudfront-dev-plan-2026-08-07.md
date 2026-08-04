# Terraform CloudFront Dev Plan Notes

## Why was the real dev plan important after mocked tests passed?

Mocked tests proved the module logic, feature flag behavior, resource counts, outputs, and validation rules without contacting AWS.

The real development plan was still necessary because it compared the current Terraform configuration with the actual remote state and real development infrastructure.

This provided evidence that adding the disabled CloudFront/OAC skeleton did not change the existing S3 environment.

## What does AWS authentication allow Terraform to access?

AWS authentication allows Terraform to:

- Initialize the remote S3 backend
- Read and refresh remote state
- Query the current AWS resources managed by Terraform
- Compare real infrastructure with the current configuration
- Produce an authenticated plan

Authentication does not automatically change infrastructure. Changes occur only if an approved apply is run.

## Why did backend initialization fail without credentials?

The Terraform backend stores state in S3.

Without valid AWS credentials, Terraform could not authenticate to the backend bucket, read the remote state, initialize the AWS provider, or refresh managed resources.

The failure occurred before a real plan could be produced.

## What did the real dev plan show?

The real development plan returned:

`No changes. Your infrastructure matches the configuration.`

Terraform refreshed the existing:

- S3 bucket
- S3 server-side encryption configuration
- S3 Block Public Access configuration
- S3 versioning configuration

The plan did not include:

- CloudFront creation
- OAC creation
- S3 bucket-policy creation
- S3 replacement
- Destroy actions
- Production changes

## Why should CloudFront remain disabled for now?

CloudFront should remain disabled because no real CloudFront development environment has been approved or applied yet.

The current evidence proves only that:

- Disabled behavior is safe in real dev
- Enabled behavior can be planned in mocked tests
- Existing S3 infrastructure remains unchanged

It does not yet prove that a real CloudFront deployment will behave correctly or that production resources match the Terraform code.

## What would be a safe next step after a clean dev plan?

A safe next step would be to improve mocked enabled-state tests and document the expected real CloudFront development plan before enabling anything.

Before a real CloudFront apply, the plan should be reviewed for:

- Exactly one OAC
- Exactly one CloudFront distribution
- Exactly one private S3 bucket policy
- No S3 replacement
- No public access
- No destroy actions
- Expected HTTPS and cache behavior
- Expected cost impact

## Why should production still remain untouched?

Production remains outside Terraform state and has not been fully inventoried or matched to the current code.

A clean development plan proves the disabled skeleton is inactive. It does not prove production import safety.

Production should remain untouched until:

- The production inventory is complete
- Terraform code matches existing resources
- State backups exist
- Import commands are prepared
- Stop conditions are documented
- Rollback procedures are tested
- A reviewed production plan shows no unsafe changes
