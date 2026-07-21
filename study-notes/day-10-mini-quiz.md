# Day 10 Mini Quiz

## 1. What problem does Terraform state solve?

Answer:Terraform state acts as a single source of truth mapping your code to real-world infrastructure

## 2. What does importing an AWS resource into Terraform do?

Answer:Importing associates an existing cloud resource with a Terraform state address so Terraform becomes aware of it without recreating or destroying it.

## 3. Why does importing a resource not automatically make the Terraform configuration safe?

Answer:Importing only updates the state file—it does not automatically write the matching HCL code, meaning any drift between your local code and the real resource could still cause accidental destruction or changes on the next run.

## 4. When might recreating a resource be safer than importing it?

Answer: Recreating may be safer when the resource is disposable, isolated, easy to reproduce, and contains no important data. It should first be tested in a dev environment rather than used to replace a working production resource.

## 5. Why should the portfolio use a separate dev environment before managing production?

Answer:A separate dev environment allows you to safely test infrastructure changes, state modifications, and automated pipelines without risking downtime, data loss, or misconfigurations in production.

## 6. Why must Terraform state be protected?

Answer: Terraform state must be protected because it maps Terraform configuration to live infrastructure, may contain sensitive values and identifiers, and can be used to make changes to real resources.

## 7. What is the purpose of `.terraform.lock.hcl`?

Answer:It locks the precise provider plugin versions and cryptographic hashes used by the project, ensuring reproducible deployments across different machines and CI/CD runners.

## 8. Which portfolio responsibilities belong to Terraform, and which belong to GitHub Actions?

Answer: Terraform should manage long-lived infrastructure such as S3 configuration, CloudFront, Origin Access Control, and IAM configuration. GitHub Actions should validate and upload website files, synchronize them to S3, and create CloudFront invalidations.

## 9. What did the Day 10 Terraform plan propose?

Answer: The Day 10 plan proposed only three output values: the AWS region, environment, and project name. It proposed zero AWS resources to add, change, or destroy.

## 10. What production Terraform commands remain prohibited at this stage?

Answer:Unreviewed, direct execution of terraform apply and destructive commands like terraform destroy against the production state remain strictly prohibited until fully validated in dev.


## Final Score

- First attempt: 8/10
- Corrected score: 10/10
