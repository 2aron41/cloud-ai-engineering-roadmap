# Terraform CI Testing Notes

Actual completion date: August 1, 2026, after the monthly Codespaces allowance reset.

## What is CI?

Continuous Integration, or CI, is the practice of automatically checking changes whenever code is pushed or submitted through a pull request. CI provides a repeatable verification process instead of relying only on a developer to remember and run every check manually.

## Why should Terraform tests run in GitHub Actions?

Terraform tests should run in GitHub Actions so every relevant change to the module is checked automatically. This helps detect formatting errors, invalid configurations, broken variable validation, and failed module tests before future changes are trusted or merged.

## Why is this safer than only testing locally?

Local testing depends on one developer's machine, environment, commands, and memory. A developer could forget a command, use uncommitted files, or have local configuration that hides a problem.

CI checks the committed repository in a fresh runner using the same documented workflow every time. This makes the result more consistent and reproducible.

## Why does this workflow not need AWS credentials?

The Terraform tests use a mocked AWS provider and `command = plan`. They evaluate the module without contacting AWS or creating real infrastructure.

Because no real AWS API calls are required, the workflow does not need AWS access keys, GitHub OIDC, an IAM role, or an AWS account session.

Avoiding unnecessary credentials also reduces security risk.

## What does `terraform fmt -check` protect against?

`terraform fmt -check` verifies that Terraform files follow Terraform's standard formatting rules.

The `-check` option reports improperly formatted files instead of modifying them. The `-recursive` option checks Terraform files throughout the current directory and its subdirectories.

This protects the repository from inconsistent Terraform formatting and causes CI to fail when formatting standards are not followed.

## What does `terraform init -backend=false` do?

`terraform init -backend=false` initializes the Terraform working directory and installs the providers or modules needed for validation and testing, while disabling backend initialization.

This prevents the CI job from trying to connect to the remote state backend. It is appropriate for isolated module tests that do not need real state.

## What does a passing CI run prove?

A passing CI run proves that the exact committed version tested by GitHub Actions:

- Follows Terraform formatting requirements.
- Can be initialized without its backend.
- Passes `terraform validate`.
- Passes the existing mocked-provider Terraform tests.
- Produces the expected results for the test cases currently written.
- Can be tested successfully in a clean GitHub-hosted environment.

## What does a passing CI run not prove?

A passing CI run does not prove that:

- Real AWS credentials and permissions are correct.
- The module can successfully create or modify real AWS resources.
- The remote backend is available or correctly configured.
- Existing AWS resources can be imported safely.
- A real dev or production plan contains no unexpected changes.
- Every possible input or failure condition has been tested.
- The infrastructure is secure, highly available, cost-efficient, or production-ready.

## Why is a real dev Terraform plan still useful?

A real dev Terraform plan compares the Terraform configuration and state with actual AWS infrastructure.

It can detect drift, permission problems, provider behavior, resource replacement, destructive changes, and differences that mocked unit tests cannot detect.

Mocked tests and a real dev plan serve different purposes and should complement each other.

## Why should production migration still wait?

Production migration should wait until the dev environment and migration process are thoroughly verified.

Before production migration, the project still needs:

- A reviewed real dev plan.
- Safe import procedures for existing resources.
- State backups and recovery procedures.
- Confirmation that no resources will be unexpectedly destroyed or replaced.
- AWS permissions verification.
- Additional tests for production-sensitive behavior.
- Clear rollback and incident procedures.
- Human review before applying infrastructure changes.

A passing mocked CI test is an important quality gate, but it is not production authorization.
