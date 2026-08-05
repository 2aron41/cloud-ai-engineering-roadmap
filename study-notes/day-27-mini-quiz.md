# Day 27 Mini Quiz — August 5, 2026

## 1. Why should import drift be reduced before production resources are imported?

It makes the first post-import plan easier to understand and separates infrastructure adoption from intentional changes.

## 2. What is the difference between `null` and an empty CloudFront comment?

`null` means use the module-generated default, while an empty string preserves the existing production comment exactly.

## 3. Why did `coalesce()` fail to preserve the empty production comment?

It treated the empty string as unavailable and returned the module-generated fallback value.

## 4. Why could the CloudFront origin not be accessed with `[0]`?

Terraform represents the `origin` block as a set of objects, and set elements are not index-addressable.

## 5. What expression was used to read the single origin ID in the test?

A `for` expression wrapped in `one()`.

## 6. Why is the SourceArn condition operator configurable?

Production uses `ArnLike`, while development uses `StringEquals`; configurability allows Terraform to match both environments.

## 7. What invalid condition operator is rejected by the tests?

`StringLike`.

## 8. What empty CloudFront values are rejected?

An empty origin ID and an empty OAC name.

## 9. How many Terraform tests now pass?

13 tests pass and 0 fail.

## 10. What is the main unresolved production design difference?

Production resources have no tags, while the module requires standard tags.
