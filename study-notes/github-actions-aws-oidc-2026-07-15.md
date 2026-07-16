# GitHub Actions + AWS OIDC Notes

## Problem

GitHub Actions needs permission to deploy the portfolio website to AWS.

The workflow eventually needs to update objects in one private S3 bucket and create invalidations for one CloudFront distribution.

## Unsafe Approach

An unsafe approach would be to create long-term AWS access keys and save them as GitHub secrets.

Those credentials would remain valid until they were manually rotated, disabled, or deleted. If they were exposed, another person could potentially use them outside the approved GitHub Actions workflow.

## Safer Approach

Use OpenID Connect, or OIDC, so GitHub Actions can prove its identity to AWS and request temporary credentials.

AWS can check which repository, branch, or GitHub environment requested access before allowing the workflow to assume an IAM role.

## What is OIDC?

OIDC is an identity system that lets one trusted platform confirm an identity to another platform.

For this project:

1. GitHub creates a short-lived identity token for the workflow.
2. AWS verifies that the token came from GitHub.
3. AWS checks the IAM role's trust policy.
4. The trust policy confirms that the request came from the approved repository and branch or environment.
5. AWS provides temporary credentials if all conditions match.

No permanent AWS access key needs to be stored in GitHub.

## What is an IAM role?

An IAM role is an AWS identity with a set of permissions that can be assumed temporarily.

Unlike an IAM user, a role does not need permanent credentials attached to it.

The future GitHub Actions deployment role should be assumable only by an approved workflow identity from:

- Repository: `2aron41/aws-serverless-portfolio`
- Approved branch: `main`
- Approved GitHub environment, if one is added later

## Why are temporary credentials safer?

Temporary credentials:

- Expire automatically
- Are created only when the workflow runs
- Reduce the value of credentials if they are exposed
- Can be restricted by the IAM role's permissions
- Can be restricted by the role's trust policy
- Do not require storing permanent AWS access keys in GitHub

Temporary credentials do not make a workflow automatically secure. The trust policy, role permissions, branch restrictions, workflow permissions, and repository security must still be configured correctly.

## What permissions should the deployment role have?

The deployment role should eventually have only the permissions required to:

- List the specific portfolio S3 bucket when needed for synchronization
- Upload and update website objects in the specific portfolio S3 bucket
- Delete objects from that bucket only if the approved synchronization design requires deletion
- Create CloudFront invalidations for the specific portfolio distribution

Project resources:

- S3 bucket: `2aron41-aws-portfolio-20260713`
- CloudFront distribution: `EUWNERX790PYN`

The role should use resource restrictions wherever AWS supports them.

## What should the role NOT be allowed to do?

The deployment role should not be allowed to:

- Perform administrator actions
- Create or modify IAM users, roles, or policies
- Access unrelated S3 buckets
- Change S3 Block Public Access
- Make the portfolio bucket public
- Delete the S3 bucket
- Create or delete CloudFront distributions
- Modify unrelated CloudFront distributions
- Change billing, budgets, or account settings
- Create long-term AWS access keys
- Deploy from an unapproved repository or branch

## Trust Policy Versus Permissions Policy

The trust policy answers:

> Who is allowed to assume this role?

For this project, it should restrict access to the GitHub OIDC provider and the approved repository plus branch or environment.

The permissions policy answers:

> What may the role do after it is assumed?

For this project, it should allow only the required S3 deployment and CloudFront invalidation actions.

Both policies must be restrictive.

## My One-Sentence Explanation

GitHub Actions will use OIDC to prove that an approved workflow from my portfolio repository is running, and AWS will provide temporary credentials for a least-privilege deployment role without storing permanent access keys in GitHub.
