# GitHub Actions Validation Notes

## Why validate before deploying?

Validation catches missing files, incorrect filenames, broken source references, and possible exposed secrets before AWS credentials are requested or production resources are changed.

## What mistake from Day 6 does validation prevent?

It prevents the accidental deployment of an incorrectly named file such as `index-.html` instead of `index.html`.

## What files must exist before deployment?

- `website/index.html`
- `website/styles.css`

## What files should not exist?

- `website/index-.html`
- Files containing obvious AWS credentials or private keys

## Why should validation happen before AWS authentication?

Invalid source files should be rejected before the workflow requests temporary AWS credentials. This reduces unnecessary access to AWS and ensures failed input cannot reach deployment steps.

## What did the controlled failure test prove?

Creating `website/index-.html` caused the validation script to exit with code 1. After removing the file, validation passed again. This proved that the workflow detects the exact Day 6 filename mistake and recovers after correction.

## What should happen if validation fails?

- The workflow should stop immediately.
- AWS deployment steps should not run.
- S3 files should not be changed.
- A CloudFront invalidation should not be created.
- The error should identify what must be fixed.

## Final Result

The standalone validation script and GitHub Actions workflow were created. The script passed normally, failed during the controlled `index-.html` test, and passed again after recovery.
