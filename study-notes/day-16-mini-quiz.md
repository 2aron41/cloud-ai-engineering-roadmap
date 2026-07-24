# Day 16 Mini Quiz

## 1. Why is module testing useful?

Module testing verifies reusable Terraform behavior before the module is trusted by additional environments.

## 2. What is the difference between `terraform validate` and `terraform test`?

`terraform validate` checks whether the configuration is structurally valid. `terraform test` executes defined test runs and evaluates assertions and expected failures.

## 3. Why should invalid inputs be tested?

Invalid-input tests prove that validation rules stop known mistakes before they reach a provider or infrastructure plan.

## 4. What should happen if a required tag is missing?

Terraform should reject the input with a clear validation error before any AWS resource change is attempted.

## 5. Why should production resources not be used for first module tests?

An incorrect test or configuration could disrupt live infrastructure. Mocked providers and dev environments are safer first targets.

## 6. What does a passing test prove?

A passing test proves that the tested inputs, assertions, and expected failures behaved as defined during that test run.

## 7. What does a passing test not prove?

It does not prove that every possible input works, that the real AWS environment is unchanged, or that production migration is safe.

## 8. Why should production migration wait until the module is tested?

Testing reduces the risk that invalid inputs or incorrect resource behavior will appear for the first time during a live production migration.

## 9. Why is a clean final plan still required after tests pass?

Tests can use mocks and sample inputs. A real plan compares the actual dev configuration, state, and AWS resources and confirms that no unintended changes exist.

## 10. What would make you stop before applying Terraform?

I would stop for any unexpected creation, change, replacement, destroy action, access-control weakening, IAM expansion, production change, or unexplained plan result.
