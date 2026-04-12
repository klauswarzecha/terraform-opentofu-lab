# terraform-opentofu-lab

Personal Terraform and OpenTofu playground for hands-on AWS infrastructure practice.

This repository is used to:

- Practice infrastructure-as-code in a clean, reproducible way
- Prepare for the Terraform Associate certification
- Experiment with OpenTofu as an open-source alternative
- Deploy short-lived AWS infrastructure (deploy → test → destroy)

The goal is not only certification prep, but disciplined infrastructure engineering.

--- 

## Prerequisites

- AWS account
- AWS credentials configured locally (aws configure or environment variables)
- Terraform (>= 1.11) or OpenTofu (>= 1.11 compatible)

--- 

## Tooling

This project is compatible with:

- Terraform (>= 1.11)
- OpenTofu (>= 1.11 compatible versions)

Both tools use the same configuration syntax and remote backend setup. 

It is crucial to use recent versions (> 1.10.0), since these allow state locking in an S3 backend __without__ an 
additional table in DynamoDB!

---

## Repository Structure

```bash
terraform-opentofu-lab/
├── bootstrap/   → creates S3 backend
├── envs/
│   ├── dev/     → environment-specific configuration (dev)
│   └── prod/    → environment-specific configuration (prod)
├── modules/     → reusable modules (S3, VPC, etc.)
├── labs/        → independent labs to examine HCL
```

### Pattern used:

- Environment-based configuration (envs/dev, envs/prod)
- Remote state in S3 with state locking 
- No workspaces (explicit environment separation via directories)

---

## Bootstrap (Remote State Setup)

First, create the remote state infrastructure:

### Terraform:

```bash
cd bootstrap
terraform init
terraform apply
```


### OpenTofu:

```bash
cd bootstrap
tofu init
tofu apply
```


This creates:

- S3 bucket for Terraform/OpenTofu state

After bootstrap, update the bucket name in:

```bash
envs/dev/backend.tf
envs/prod/backend.tf
```

#### Note

- Backend configuration is __intentionally manual__ and explicit.
  The S3 bucket name is not injected dynamically.

  This avoids hidden coupling between bootstrap and the environments, and keeps backend configuration predictable and transparent.

  Dynamic naming and random suffixes are used only for actual infrastructure, not for the Terraform state backend.



---

## Design Decisions

- Remote backend from the beginning
- No long-running infrastructure
- Cost-aware experimentation

---

## Cost Awareness

All resources are:

- Minimal in size
- Tagged
- Designed for short-lived testing only


## Labs

This repository contains a set of small, focused labs exploring specific Terraform/OpenTofu concepts:

- for_each vs count
- data sources and locals
- lifecycle rules (prevent_destroy, create_before_destroy)
- state handling (import, moved, removed)
- input validation and complex types

Each lab is isolated and designed for incremental learning.