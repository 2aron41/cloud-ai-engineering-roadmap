# Day 26 Mini Quiz — August 5, 2026

## 1. Why should production use a separate Terraform environment?

It isolates production configuration and future state from development, reducing cross-environment risk.

## 2. Why was the production backend kept as `backend.tf.example`?

It documents the future backend without allowing accidental production initialization during planning.

## 3. Why was no real production `terraform.tfvars` created?

Day 26 was planning only. Avoiding a real variables file reduces the risk of accidentally running production Terraform commands.

## 4. Why were CloudFront allowed methods made configurable?

Development and production currently use different allowed methods, so configurability lets both use the same module without forcing production drift.

## 5. What methods does the production-compatible test use?

`GET` and `HEAD`.

## 6. What invalid method was tested and rejected?

`POST`.

## 7. How many Terraform tests passed after the Day 26 changes?

10 tests passed and 0 failed.

## 8. Which production resources are planned for import?

The S3 bucket, Block Public Access, versioning, encryption, OAC, CloudFront distribution, and S3 bucket policy.

## 9. Why should resources be imported individually?

Each state binding can be verified immediately, reducing the chance of unnoticed errors.

## 10. What should be used to correct a wrong import binding?

A reviewed `terraform state rm` operation after backing up state, not `terraform destroy`.
