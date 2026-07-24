# Terraform Test Notes

## What does `terraform test` do?

`terraform test` discovers Terraform test files, runs their defined plan or apply operations, evaluates assertions, and reports whether each run passed or failed.

## Why should modules be tested?

Modules may be reused by multiple environments. Testing helps confirm that inputs, validation rules, resource settings, and outputs behave consistently before the module is trusted with more infrastructure.

## What kinds of mistakes can tests catch?

- Invalid or missing module inputs
- Incorrect resource attributes
- Missing required tags
- Disabled versioning
- Weakened public-access protections
- Unsupported environment values
- Unexpected module behavior after refactoring

## Why should invalid inputs be tested?

Invalid-input tests prove that validation rules actually reject known mistakes instead of only confirming that valid examples work.

## Why should module tests happen before production migration?

Production resources are live and harder to recover. Module tests provide a safer way to detect input and configuration problems before production imports or plans are attempted.

## What did my tests prove?

- A valid bucket name is accepted.
- The `dev` environment is accepted.
- All five required tags can be supplied.
- Versioning resolves to `Enabled`.
- All four S3 public-access protections remain enabled.
- An empty bucket name is rejected.
- A bucket name with uppercase characters is rejected.
- The unsupported `staging` environment is rejected.
- A tag map missing `Purpose` is rejected.
- All five test runs passed.

## What still needs better testing later?

- Native tests for disabled or suspended versioning behavior
- Output-value assertions
- More complete S3 bucket-name validation cases
- Tests for tag values matching the selected environment
- Integration tests against an isolated temporary AWS account or sandbox
- Future CloudFront and Origin Access Control tests
- Tests for production migration code before any import

## Day 16 result

- `terraform validate`: Success
- `terraform test` exit code: `0`
- Test result: `5 passed, 0 failed`
- Final real dev plan exit code: `0`
- Final dev plan: `No changes. Your infrastructure matches the configuration.`
- Production resources changed: No
