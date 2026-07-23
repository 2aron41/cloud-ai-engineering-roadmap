# Day 13 Mini Quiz

## 1. Why is local Terraform state risky in Codespaces?

Local state is tied to one temporary Codespace. If the Codespace is rebuilt, deleted, or replaced, Terraform may lose the file that connects its configuration to the existing cloud resources.

## 2. What does a remote backend do?

A remote backend stores Terraform state in a centralized location outside the local development environment. It can provide durable storage, access control, version history, encryption, and state locking.

## 3. Why should the Terraform state bucket be separate from the app bucket?

The state bucket stores Terraform operational data, while the application bucket stores application or website content. Separating them reduces accidental deletion, avoids mixing security responsibilities, and prevents the backend from depending on the infrastructure whose state it stores.

## 4. Why should the state bucket have versioning enabled?

Versioning preserves earlier versions of the state object. It can help recover from accidental overwrites, corruption, or deletion.

## 5. Why should public access be blocked on the state bucket?

Terraform state can contain resource identifiers, infrastructure details, generated values, and potentially sensitive information. It should never be publicly accessible.

## 6. What does `terraform init -migrate-state` do?

It reinitializes Terraform after a backend change and copies the existing state from the previous backend into the newly configured backend.

## 7. What should be backed up before migration?

The current Terraform state should be pulled and stored securely outside Git before migration. The current state list and clean Terraform plan should also be recorded.

## 8. What does state locking protect against?

State locking prevents multiple Terraform operations from writing to the same state at the same time, reducing the risk of conflicting updates or corrupted state.

## 9. Why should credentials not be placed in backend configuration?

Backend configuration is stored in source files and local Terraform metadata. Hardcoded credentials could be exposed through Git, logs, copies, or repository history. Terraform should use temporary credentials or another supported authentication method.

## 10. What final result proves the migration worked safely?

The same intended resources remain in `terraform state list`, the remote state object exists at the correct S3 key, and the final `terraform plan` reports:

```text
No changes. Your infrastructure matches the configuration.
```
