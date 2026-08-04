# Terraform S3 Encryption Notes

## What is S3 default encryption?

S3 default encryption automatically encrypts new objects stored in a bucket. Managing it through Terraform makes the setting repeatable, reviewable, testable, and stored in version control.

## What is SSE-S3?

SSE-S3 is server-side encryption using keys managed by Amazon S3. The module uses the `AES256` algorithm, so AWS manages the encryption keys and handles encryption and decryption automatically.

## Why start with AES256 instead of KMS?

SSE-S3 with AES256 is simpler because it does not require a customer-managed KMS key, key policies, or additional KMS permissions.

KMS can be added later when the project needs more detailed key control, auditing, or separate access policies.

## Why should encryption be part of the module?

Encryption belongs in the reusable module so every environment receives the same secure configuration.

The static-site module now manages:

- S3 Block Public Access
- Versioning
- Default encryption
- Required tags

## Why should encryption default to enabled?

Security-sensitive settings should use secure defaults.

The `enable_encryption` variable defaults to `true`, so encryption is enabled unless someone deliberately disables it. This is safer than requiring each environment to remember to enable it manually.

## What did the Terraform plan show?

The development plan showed:

- 1 resource to add
- 0 resources to change
- 0 resources to destroy

The only added resource was:

`module.static_site.aws_s3_bucket_server_side_encryption_configuration.this[0]`

It targeted the existing development bucket and configured `AES256`. No bucket replacement or destruction was proposed.

## What did the module tests prove?

The mocked-provider tests proved that:

- Encryption defaults to enabled.
- The encryption resource is created.
- The configured algorithm is `AES256`.
- Existing versioning tests still pass.
- Existing public-access-block tests still pass.
- Existing invalid-input tests still pass.

Local result: 5 passed, 0 failed.

Final GitHub Actions run: `30733357853`, passed.

## What did the module tests not prove?

The mocked tests did not prove that:

- AWS credentials were valid.
- The remote backend was accessible.
- AWS would accept the real resource.
- The existing dev bucket could be changed safely.
- Terraform state matched the real infrastructure.
- Encryption was active after the apply.
- Production was safe to modify.

Those checks required a real dev plan, apply, AWS CLI verification, state inspection, and final Terraform plan.

## How did I verify production was unchanged?

Terraform was run only from `infra/environments/dev`.

The plan referenced only the development bucket:

`aws-serverless-portfolio-dev-2aron41-8ab73efa81e3bceff8c0a3d066`

The apply result was:

`1 added, 0 changed, 0 destroyed`

AWS CLI and Terraform state confirmed `AES256` encryption on the dev bucket. The final plan showed:

`No changes. Your infrastructure matches the configuration.`

No production directory, state, bucket, or resource was planned or applied.
