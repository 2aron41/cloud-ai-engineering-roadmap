# Day 28 Mini Quiz — August 5, 2026

## 1. Does passing a planning-readiness gate authorize production import?

No. Planning readiness and execution authorization are separate decisions.

## 2. What was the Day 28 execution decision?

Production import execution was not authorized.

## 3. Why were required tags kept in the module?

They preserve consistent governance standards across environments.

## 4. When should production tag additions be applied?

Through a separate reviewed plan after the initial import session.

## 5. Are website objects included in the planned Terraform import scope?

No. The current import scope covers infrastructure resources, not website files.

## 6. What should be verified before every import command?

AWS identity, account, production directory, backend key, Terraform address, and AWS import identifier.

## 7. Why should resources be imported one at a time?

Each state binding can be inspected and verified before continuing.

## 8. What are the five post-import plan classifications?

Provider normalization, tag adoption, deferred improvement, module mismatch, and destructive or unacceptable change.

## 9. What should happen if Terraform proposes replacing CloudFront?

Stop immediately and do not apply.

## 10. Was production changed during Day 28?

No.
