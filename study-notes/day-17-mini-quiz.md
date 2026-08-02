# Day 17 Mini Quiz

Actual completion date: August 1, 2026.

## 1. Why should Terraform module tests run automatically?

They should run automatically so every relevant committed change receives the same repeatable checks. This catches problems early and prevents testing from depending entirely on a developer remembering to run commands manually.

## 2. What is the difference between local testing and CI testing?

Local testing runs on the developer's current machine and may include uncommitted files or machine-specific configuration. CI testing runs the committed code in a fresh, standardized runner and provides a shared result that others can review.

Both are useful. Local testing gives fast feedback before committing, while CI independently verifies the pushed version.

## 3. Why should this test workflow avoid AWS credentials?

The tests do not require real AWS access because they use a mocked provider. Adding credentials would provide no testing benefit while unnecessarily increasing the workflow's security exposure.

## 4. What does a mocked provider allow?

A mocked provider allows Terraform tests to evaluate plans, validations, resource arguments, outputs, and assertions without contacting the real cloud provider or creating infrastructure.

## 5. What does `terraform fmt -check -recursive` verify?

It verifies that Terraform files in the directory and its subdirectories follow Terraform's standard formatting. It reports formatting problems without rewriting the files.

## 6. What does `terraform init -backend=false` avoid?

It avoids initializing or connecting to the configured Terraform backend. This prevents the isolated test workflow from accessing remote state while still preparing the working directory for validation and testing.

## 7. Why should a passing CI workflow not be treated as production approval?

It only proves that the configured checks and mocked tests passed. It does not verify real AWS permissions, actual infrastructure behavior, state imports, drift, destructive changes, operational readiness, or every production risk.

## 8. What extra checks are still needed before production import?

Extra checks include reviewing real dev plans, testing imports in a safe environment, backing up state, confirming resource addresses, checking for replacement or destruction, validating AWS permissions, reviewing security and cost impact, and preparing rollback procedures.

## 9. Why are path filters useful in GitHub Actions?

Path filters prevent the workflow from running when unrelated files change. This saves runner time and makes workflow activity more relevant.

This workflow runs when the static-site module or its workflow file changes.

## 10. What would make you stop before merging infrastructure changes?

I would stop if formatting, initialization, validation, testing, or planning failed; if the plan showed unexpected deletion or replacement; if credentials or permissions were unclear; if state was not backed up; if the change affected production without review; or if I could not explain the expected result and rollback procedure.
