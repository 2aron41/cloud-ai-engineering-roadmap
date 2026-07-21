# GitHub Actions + AWS OIDC Implementation — July 16, 2026

## Objective

Automate deployment of the AWS portfolio through GitHub Actions without storing long-term AWS access keys.

## Deployment Scope

- Repository: `2aron41/aws-serverless-portfolio`
- Branch: `main`
- Source: `website/`
- Region: `us-east-1`
- S3 bucket: `2aron41-aws-portfolio-20260713`
- CloudFront distribution: `EUWNERX790PYN`

## Authentication

GitHub Actions requests an OIDC token. AWS verifies the token and allows the workflow to assume a dedicated IAM deployment role. AWS then issues temporary credentials. No permanent AWS access keys are stored in GitHub.

## Trust and Permissions

The role trust policy restricts access to the approved GitHub repository and the `main` branch. The permissions policy allows only the required S3 deployment actions and CloudFront invalidation actions.

Trust policy question: Who can assume the role?

Permissions policy question: What can the role do?

## Workflows

- `.github/workflows/aws-oidc-test.yml` tests role assumption with `aws sts get-caller-identity`.
- `.github/workflows/deploy-portfolio.yml` validates files, assumes the role, synchronizes `website/` to S3, and invalidates CloudFront.
- Production deployment currently uses manual `workflow_dispatch`.

## Validation and Failure Testing

The workflow checks that `website/index.html` and `website/styles.css` exist before deployment. A controlled missing-file failure confirmed that the workflow stopped before changing S3 or creating an invalidation. After correcting the validation condition, the workflow completed successfully.

## Post-Deployment Results

- GitHub Actions authentication succeeded using temporary credentials.
- Website files synchronized to the private S3 bucket.
- CloudFront invalidation was accepted.
- The HTTPS website and stylesheet loaded correctly.
- Direct S3 access remained blocked.
- S3 Block Public Access remained enabled.

## What I Learned

- OIDC is safer than storing long-term AWS keys.
- Trust policies and permissions policies solve different security questions.
- Deployment validation must happen before production changes.
- CI/CD pipelines should be tested for failure and recovery.
- `aws s3 sync --delete` requires careful source validation.

## Final Outcome

Day 8 completed the secure GitHub Actions deployment milestone using OIDC, temporary AWS credentials, least privilege, private S3, CloudFront invalidation, and deployment validation.
