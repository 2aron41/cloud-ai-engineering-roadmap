# Day 9 Mini Quiz

## 1. What does `terraform init` do?

Answer:terraform init initializes a working directory by downloading required provider plugins, setting up modules, and configuring the backend for state storage.

## 2. What is the purpose of `terraform fmt`?

Answer:terraform fmt automatically formats Terraform configuration files to follow standard HCL styling conventions for improved readability and consistency.

## 3. What does `terraform validate` check?

Answer:terraform validate checks the configuration files for internal consistency, proper syntax, and valid resource references without connecting to remote services or state.

## 4. What information does `terraform plan` provide?

Answer:terraform plan compares your configuration to the current state and displays an execution plan showing the exact actions (additions, modifications, or deletions) Terraform will perform.

## 5. Why was no Terraform state file created during this lab?

Answer:No local state file was created because terraform apply was never executed (or because state was maintained remotely in a backend like S3 rather than generated locally).

## 6. What is the difference between `.terraform/` and `.terraform.lock.hcl`?

Answer:.terraform/ is a local directory storing downloaded provider binaries and modules, while .terraform.lock.hcl is a tracked dependency lockfile that ensures consistent provider plugin versions across all environments.

## 7. Why must Terraform state not be committed to a public Git repository?

Answer:Terraform state files contain sensitive data in plain text, such as passwords, API tokens, database connection strings, and internal infrastructure details.

## 8. What did the controlled variable failure prove?

Answer:It proved that Terraform's input validation rules and variable constraints correctly catch invalid parameters before creating an execution plan or modifying real infrastructure.

## 9. What does a Terraform provider do?

Answer:A provider is a plugin that translates Terraform HCL code into API calls to manage specific cloud platforms, services, or software tools (like AWS, Azure, or GitHub).

## 10. What does `1 to add, 0 to change, 0 to destroy` mean?

Answer:It indicates that applying the plan will create one new resource, modify no existing resources, and delete no current resources.

## Score

- Correct: 10/10
- Percentage: 100%
- Confidence: High — I understand initialization, formatting, validation, planning, providers, dependency locking, variable validation, and Terraform state safety.

# Original Day 9 Checklist Quiz

## 1. What does `terraform init` do?

Answer: It initializes the working directory, installs required providers and modules, configures the backend, and creates or updates dependency information.

## 2. What is the purpose of `terraform fmt`?

Answer: It formats Terraform configuration files using the standard HCL style.

## 3. What does `terraform validate` check?

Answer: It checks configuration syntax and internal consistency without applying infrastructure changes.

## 4. Why is `terraform plan` important?

Answer: It previews proposed additions, changes, and deletions so the plan can be reviewed before infrastructure is modified.

## 5. What does Terraform state track?

Answer: State tracks the relationship between Terraform resource addresses and the real resources Terraform manages.

## 6. Why can Terraform be dangerous?

Answer: An incorrect or unreviewed configuration can modify or delete real infrastructure and data.

## 7. Should CloudFront invalidation be handled by Terraform or GitHub Actions in your project? Why?

Answer: GitHub Actions should handle invalidation because it is an application deployment operation that should run after updated website files are synchronized. Terraform should manage the long-lived CloudFront infrastructure.

## 8. Why should secrets not be committed to GitHub?

Answer: Secrets committed to Git may be exposed publicly and can remain accessible through repository history even after the visible file is changed.

## 9. What does Infrastructure as Code help you reproduce?

Answer: It helps reproduce consistent infrastructure configurations across environments using version-controlled code.

## 10. What does `No changes. Your infrastructure matches the configuration.` mean?

Answer: Terraform found no differences between the desired configuration, state, and managed infrastructure that require action.

## Original Checklist Score

- Correct: 10/10
- Percentage: 100%
- Confidence: High
