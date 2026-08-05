# Terraform Production Resource Inventory Notes — August 5, 2026

## Why inventory production before importing it?

An inventory establishes what already exists in AWS before Terraform begins managing it. This includes resource identities, configuration settings, dependencies, security controls, website files, and differences from the current Terraform module.

Without an inventory, Terraform configuration could unintentionally describe a different infrastructure design and propose unexpected production changes after import.

## What production resources were identified?

The existing production portfolio includes:

- One private S3 bucket containing the website files
- One deployed CloudFront distribution
- One CloudFront Origin Access Control
- One S3 bucket policy granting CloudFront read access

The account also contains a separate development stack and a Terraform remote-state bucket.

## What protects the production S3 bucket?

All four S3 Block Public Access settings are enabled. The bucket policy status reports that the bucket is not public, and direct S3 access returns `403 Forbidden`.

CloudFront can still retrieve objects because the bucket policy grants the CloudFront service principal `s3:GetObject` access when the request originates from the production distribution.

## Does production use OAC or legacy OAI?

Production uses Origin Access Control.

The production OAC:

- Uses the `s3` origin type
- Always signs requests
- Uses the `sigv4` signing protocol

The CloudFront origin does not use a legacy Origin Access Identity.

## How was production content verified?

The production S3 bucket contains:

- `index.html`
- `styles.css`

The files total 6,534 bytes.

The production CloudFront URL returned `HTTP/2 200`, while direct S3 access returned `HTTP/1.1 403 Forbidden`.

## What important differences exist between production and dev?

Production currently differs from the development module in several areas:

- Production uses `PriceClass_All`; dev uses `PriceClass_100`.
- Production allows `GET` and `HEAD`; dev also allows `OPTIONS`.
- Production versioning is disabled; dev versioning is enabled.
- Production has no bucket tags; the Terraform module requires tags.
- Production uses `ArnLike` in the bucket policy; dev uses `StringEquals`.

These differences could create planned changes after import.

## Why should Terraform match production before intentional improvements?

The safest import approach is generally to model the existing resource configuration closely enough that Terraform does not immediately propose replacement or broad modification.

After the resources are safely imported and stable, improvements can be proposed separately through reviewed plans.

This separates adoption of existing infrastructure from intentional infrastructure changes.

## Why must production use a separate Terraform state?

Development and production have different resources and different risk levels. A separate production state prevents accidental cross-environment management and reduces the blast radius of mistakes.

The production environment should use a separate remote-state key and must not import resources into the existing development state.

## Why are production objects important even if Terraform manages only infrastructure?

The S3 objects are the live website content. A Terraform import should not delete, overwrite, or otherwise disrupt those objects.

They should be backed up and verified before production infrastructure changes are considered.

## What does the current inventory prove?

The inventory proves that:

- Production is currently operational.
- The production S3 bucket is private.
- CloudFront can deliver the website.
- OAC is already configured.
- Production is not in the development Terraform state.
- No production import or modification occurred during Day 25.

## What must happen before production import?

Before import:

1. Create a separate production Terraform environment.
2. Configure a separate production state key.
3. Back up existing production configuration and content.
4. Add module flexibility for current production settings.
5. Prepare exact import addresses and IDs.
6. Review all commands before running them.
7. Stop if Terraform proposes destructive or unexpected changes.
