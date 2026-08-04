# Day 18 Mini Quiz

## 1. What does S3 default encryption do?

S3 default encryption automatically encrypts new objects when they are stored in the bucket. It avoids requiring every upload request to specify encryption separately.

## 2. What does SSE-S3 use to encrypt objects?

SSE-S3 uses encryption keys managed by Amazon S3. The configured Terraform algorithm is `AES256`.

AWS handles the encryption keys and automatically encrypts and decrypts the objects.

## 3. Why is KMS more advanced than SSE-S3?

AWS KMS provides more control over encryption keys, access policies, auditing, rotation, and permissions.

It is more advanced because it requires managing KMS keys, key policies, and permissions. SSE-S3 is simpler because Amazon S3 manages the keys automatically.

## 4. Why should encryption be a secure default in a Terraform module?

A secure default protects every environment that uses the module, even if someone forgets to configure encryption manually.

The `enable_encryption` variable defaults to `true`, so encryption is enabled unless someone deliberately turns it off.

## 5. What Terraform resource configures S3 bucket encryption?

The resource is:

`aws_s3_bucket_server_side_encryption_configuration`

In this module, its address is:

`aws_s3_bucket_server_side_encryption_configuration.this`

## 6. Why should mocked tests run before applying to dev?

Mocked tests provide fast feedback without contacting AWS or changing real infrastructure.

They can verify variable behavior, planned resource arguments, encryption defaults, public-access settings, versioning, and invalid inputs before a real dev plan is attempted.

## 7. Why is a real dev plan still needed after tests pass?

Mocked tests do not compare Terraform with real AWS infrastructure or remote state.

A real dev plan can reveal provider behavior, permission problems, drift, resource replacements, unexpected changes, or destruction that mocked tests cannot detect.

## 8. What plan result would be safe for this change?

The safe expected result was:

`Plan: 1 to add, 0 to change, 0 to destroy.`

The only added resource needed to be the encryption configuration for the existing development bucket.

## 9. What plan result would make you stop?

I would stop if the plan showed:

- Any resource destruction
- Any resource replacement
- Changes to the S3 bucket itself
- Changes outside the development environment
- More than one unexpected resource addition
- Production resources
- A different encryption algorithm
- An unexpected bucket name or AWS account

## 10. Why should production remain untouched today?

The encryption change needed to be tested and verified safely in development first.

The development environment allowed me to review the plan, apply one controlled resource, confirm encryption through AWS CLI and Terraform state, and run a final no-change plan before considering any future production work.
