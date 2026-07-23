# Day 14 Mini Quiz

## 1. What is a Terraform module?

A Terraform module is a collection of related Terraform resources, variables, and outputs that are grouped together and can be reused by other Terraform configurations.

## 2. Why are modules useful?

Modules reduce duplicated configuration, create consistent infrastructure patterns, make environments easier to maintain, and allow tested infrastructure designs to be reused.

## 3. What problem do `moved` blocks solve?

Moved blocks tell Terraform that a resource address has changed while the real infrastructure object remains the same. They allow Terraform to update state tracking without destroying and recreating the resource.

## 4. Why might Terraform destroy and recreate resources during a refactor if moved blocks are missing?

Terraform compares resource addresses. If the old address disappears and a new module address appears without a moved block, Terraform may interpret them as two different resources.

## 5. Why should the state be backed up before refactoring?

A backup provides a recovery point if the new configuration, resource addresses, or moved blocks are incorrect.

## 6. What plan result would make you stop immediately?

I would stop for any bucket destruction, replacement, duplicate bucket creation, unexpected tag change, production change, or CloudFront or IAM resource action.

## 7. Why should the dev bucket be refactored before production resources?

Development provides a lower-risk environment for testing module inputs, moved blocks, state behavior, rollback procedures, and final plans.

## 8. What should remain outside the module for now?

CloudFront, Origin Access Control, IAM deployment permissions, website uploads, invalidations, application deployment, and production resources should remain outside the module for now.

## 9. Why should website uploads stay in GitHub Actions?

Website files change more frequently than infrastructure. GitHub Actions is better suited for validating and deploying application content, while Terraform manages longer-lived infrastructure.

## 10. What final result proves the refactor was safe?

The final state contains the three module resource addresses, the original AWS bucket remains unchanged, and Terraform reports:

```text
No changes. Your infrastructure matches the configuration.
```
