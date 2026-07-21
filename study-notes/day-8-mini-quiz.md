# Day 8 Mini Quiz

## 1. Why is AWS OIDC safer than storing long-term AWS access keys in GitHub?

Answer:AWS OIDC uses short-lived, automatically rotated temporary security credentials instead of hardcoded, long-term keys that can be accidentally leaked or compromised

## 2. What question does an IAM role trust policy answer?

Answer:A trust policy answers "Who (which identity or service) is allowed to assume this role?"

## 3. What question does an IAM permissions policy answer?

Answer:A permissions policy answers "What actions is this role allowed to perform on which AWS resources?"

## 4. Why does the GitHub Actions workflow need `id-token: write`?

Answer:The workflow requires id-token: write permission to request a JSON Web Token (JWT) from GitHub's OIDC provider to exchange with AWS for temporary credentials.

## 5. Why does the workflow need `contents: read`?

Answer:The workflow needs contents: read permission to fetch and check out the repository's code so it can build and deploy the files.

## 6. Why should source validation run before `aws s3 sync --delete`?

Answer:Running source validation first prevents corrupt, incomplete, or empty build output from executing --delete, which would permanently wipe valid files from the S3 bucket.

## 7. What did the controlled failure test prove?

Answer:It proved that the pipeline safely aborts before deploying or altering production resources whenever tests, validation checks, or security constraints fail.

## 8. Why is direct S3 access intentionally blocked?

Answer:Direct access is blocked to enforce secure delivery through CloudFront (via Origin Access Control/Identity), enabling features like caching, TLS, Web Application Firewall (WAF) protection, and custom domain routing.

## 9. What is the purpose of a CloudFront invalidation after deployment?

Answer:An invalidation clears edge location caches so global users immediately receive the updated static files from S3 rather than stale cached content.

## 10. Why is the production deployment still manually triggered?

Answer:It maintains a human-in-the-loop gate (continuous delivery rather than automated deployment) to prevent unintended or unreviewed changes from breaking the live application.

## Score

- Correct: 10/10
- Percentage: 100%
- Confidence: High — I understand OIDC, temporary credentials, IAM trust versus permissions policies, workflow permissions, validation, failure recovery, private S3, and CloudFront invalidation.
