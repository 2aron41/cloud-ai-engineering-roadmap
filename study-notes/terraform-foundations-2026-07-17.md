# Terraform Foundations — July 17, 2026

## Objective

Learn Terraform safely without modifying AWS infrastructure.

## Tools Installed

- Terraform CLI v1.15.8
- AWS CLI v2.36.4
- Platform: Ubuntu Linux amd64

## Terraform Workflow

1. Write configuration files.
2. Run `terraform init`.
3. Run `terraform fmt`.
4. Run `terraform validate`.
5. Review `terraform plan`.
6. Run `terraform apply` only after the plan is understood and approved.

## Files Created

- `terraform.tf`: Terraform and provider version requirements
- `variables.tf`: Input variable and validation rule
- `main.tf`: Random provider resource
- `outputs.tf`: Generated identifier output
- `.terraform.lock.hcl`: Exact provider dependency selection

## Initialization

`terraform init` initialized the working directory and downloaded the required provider.

The `.terraform/` directory contains downloaded provider files and is ignored by Git.

The `.terraform.lock.hcl` dependency lock file is committed to Git so future initialization uses consistent provider selections.

## Formatting and Validation

`terraform fmt` rewrites Terraform configuration into the standard format.

`terraform validate` checks whether the configuration is syntactically valid and internally consistent.

## Planning

The first Terraform plan showed:

```text
Plan: 1 to add, 0 to change, 0 to destroy.
```

No apply command was run, so the random resource was not created and no state file was written.

## Controlled Failure

The variable validation requires the project name to contain at least three characters.

Running a plan with `project_name=x` caused Terraform to reject the input and stop safely.

## Recovery

The plan was run again with `project_name=cloud-ai-roadmap`.

The configuration passed validation and returned the expected non-destructive plan.

## State Safety

- Terraform state files are ignored by Git.
- Variable files are ignored because they may contain secrets.
- Saved binary plan files are ignored.
- `.terraform/` is ignored.
- `.terraform.lock.hcl` is retained for version control.

## What I Learned

- Terraform configuration represents a desired state.
- Providers allow Terraform to interact with resource APIs.
- Initialization installs providers and prepares the working directory.
- Formatting and validation should happen before planning.
- A plan previews changes without approving them.
- Variable validation can stop invalid inputs before resources are changed.
- Terraform state maps configuration addresses to managed resources.
- State must be protected and should not be committed to a public repository.
- A dependency lock file is different from Terraform state.
- No infrastructure should be applied until the plan is understood.

## Day 9 Status

Terraform foundations completed without modifying AWS infrastructure.
