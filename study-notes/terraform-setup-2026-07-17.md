# Terraform Setup Notes

## Terraform version

Terraform v1.15.8

## AWS CLI version

aws-cli/2.36.4 Python/3.14.6 Linux/6.8.0-1052-azure exe/x86_64.ubuntu.24

## Git version

git version 2.53.0

## Environment used

GitHub Codespaces running Ubuntu Linux on amd64.

## Problems encountered

- Terraform and AWS CLI were installed in the original Codespace but were unavailable after changing Codespaces.
- The exact Day 9 practice commands initially returned `command not found`.

## Fixes

- Reinstalled Terraform through the official HashiCorp APT repository.
- Reinstalled AWS CLI v2 using the official Linux installer.
- Kept Terraform state, variable, plan, crash, override, and working-directory files protected by `.gitignore`.
