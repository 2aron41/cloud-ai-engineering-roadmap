# AWS Account Safety Notes

## Root MFA

Status: Enabled.

The AWS root user is protected with multi-factor authentication. The root account will only be used for account-level tasks that require root access.

## Budget / Billing Alert

Status: Complete.

- AWS Free Tier usage alerts are enabled.
- The `Aaron-Zero-Spend-Budget` AWS Budget was created.
- The Billing and Cost Management dashboard was reviewed.
- Recorded spending during setup was $0.00.

## Primary Region

Chosen region: US East (N. Virginia), `us-east-1`.

Reason:

The first portfolio S3 bucket was created in `us-east-1`. Using one primary region keeps the initial project resources organized and easier to manage.

CloudFront is a global service, while the S3 origin is located in `us-east-1`.

## IAM User or Role Plan

How I will avoid using root:

- Use the `aaron-admin` IAM user for daily AWS console work.
- Keep MFA enabled for both root and `aaron-admin`.
- Reserve the root user for account-level administration.
- Do not create root access keys.
- Use IAM roles and temporary credentials for future applications and automation.
- Review administrator permissions and move toward least privilege as the project develops.

## Important AWS Locations

### Billing Dashboard

AWS Console → Billing and Cost Management

This area contains:

- Bills
- Payments
- Cost Explorer
- Free Tier information
- AWS Budgets
- Billing preferences

### IAM

AWS Console → Identity and Access Management (IAM)

This area contains:

- IAM users
- User groups
- Roles
- Policies
- Security credentials
- Access reports

## Safety Rules

- Do not commit AWS keys to GitHub.
- Do not share passwords, MFA codes, QR codes, or secret keys.
- Do not make buckets public unless the architecture requires it.
- Do not create expensive resources without checking cost.
- Delete unused test resources.
- Keep S3 Block Public Access enabled when using private S3 with CloudFront.
- Use CloudFront Origin Access Control instead of public bucket access.
- Review the Billing Dashboard and AWS Budget regularly.
- Avoid using the root user for everyday work.
- Do not create long-term access keys unless they are necessary.
