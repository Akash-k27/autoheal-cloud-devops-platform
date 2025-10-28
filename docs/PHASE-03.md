# Phase 03 — CI/CD (Terraform Checks)

## Goal
Run basic Terraform quality gates on every PR/push:
- terraform fmt (format)
- terraform validate (syntax/type checks)

## What was added
- .github/workflows/tf-ci.yml (fmt + validate on PRs, pushes, and manual runs)
- .gitignore to avoid committing .terraform/, tfstate, and tfplan files
- Fixed formatting issues so CI passes

## Why it matters
- Shows DevOps discipline to reviewers
- Prevents config drift and format mismatches
- Keeps the repo clean from state artifacts

## Next
- Optional: GitHub branch protections (require PR, signed commits, passing checks)
- Optional: Add terraform plan with OIDC (no long-lived AWS keys)
