# Terraform Basics

## What is Terraform?

Terraform is an Infrastructure as Code tool that uses configuration files to describe and manage infrastructure.

## What is Infrastructure as Code?

Infrastructure as Code means defining infrastructure in version-controlled files instead of creating and changing everything manually.

## What is a provider?

A provider is a plugin that allows Terraform to communicate with a platform or service API, such as AWS, GitHub, or the random provider.

## What is a resource?

A resource is an object Terraform manages, such as an S3 bucket, CloudFront distribution, IAM role, or local practice resource.

## What is a variable?

A variable is an input that makes a Terraform configuration reusable and configurable.

## What is an output?

An output exposes useful information produced by a Terraform configuration.

## What is Terraform state?

Terraform state records the relationship between Terraform resource addresses and the real objects being managed.

## What does `terraform init` do?

It initializes the working directory, installs providers and modules, configures the backend, and creates or updates the dependency lock file.

## What does `terraform fmt` do?

It formats Terraform configuration files using the standard HCL style.

## What does `terraform validate` do?

It checks configuration syntax and internal consistency.

## What does `terraform plan` do?

It previews the actions Terraform proposes after comparing configuration, state, and available infrastructure information.

## What does `terraform apply` do?

It executes an approved Terraform plan and changes managed infrastructure.

## What does `terraform destroy` do?

It proposes and, after approval, deletes resources managed by the configuration.

## Why is Terraform powerful but risky?

Terraform can reproduce and update infrastructure consistently, but incorrect configuration or an unreviewed plan can modify or delete real resources.

## Memory Hook

Terraform is a blueprint plus a change engine. It compares code, state, and infrastructure, then proposes changes.
