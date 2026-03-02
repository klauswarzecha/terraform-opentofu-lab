# terraform-opentofu-lab

Personal Terraform and OpenTofu playground for hands-on AWS infrastructure practice.

This repository is used to:

- Practice infrastructure-as-code in a clean, reproducible way
- Prepare for the Terraform Associate certification
- Experiment with OpenTofu as an open-source alternative
- Deploy short-lived AWS infrastructure (deploy → test → destroy)

The goal is not only certification prep, but disciplined infrastructure engineering.

---

## Tooling

This project is compatible with:

- Terraform (>= 1.6)
- OpenTofu (>= 1.6 compatible versions)

Both tools use the same configuration syntax and remote backend setup.

---

## Repository Structure

terraform-opentofu-lab/
- bootstrap/     → Creates S3 backend + DynamoDB lock table
- infra/         → Actual infrastructure definitions
- infra/env/     → Environment-specific tfvars
- infra/backend/ → Backend configuration per environment

Pattern used:

- Single root configuration
- Multiple tfvars (dev/test/prod)
- Remote state in S3
- DynamoDB state locking
- No workspaces

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
- DynamoDB table for state locking

---

