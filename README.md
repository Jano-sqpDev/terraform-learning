# 🚀 Terraform Learning Journey

A progressive series of Terraform exercises building from basic EC2
to complete production-ready AWS infrastructure.

Transitioning from VFX & IT background into DevOps engineering.

---

## 📋 Exercises

| # | Exercise | Status | Key Concepts |
|---|---|---|---|
| 00 | First Steps — Playground | ✅ Complete | VPC, EC2, Security Groups, SSH |
| 01 | Minimal EC2 with nginx | ✅ Complete | AMI data source, user_data, key pair |
| 02 | Variables and Outputs | ✅ Complete | variables.tf, locals, outputs, file separation |
| 03 | VPC From Scratch | ⬜ Planned | Public/private subnets, NAT Gateway, Bastion |
| 04 | Code Organisation | ⬜ Planned | File structure, locals, tagging strategy |
| 05 | Remote State | ⬜ Planned | S3 backend, DynamoDB locking |
| 06 | Modules | ⬜ Planned | Reusable modules, DRY principles |
| 07 | Workspaces | ⬜ Planned | Multi-environment, dev/staging/prod |
| 08 | Auto Scaling | ⬜ Planned | ALB, Launch Template, ASG |
| 09 | GitHub Actions CI/CD | ✅ Complete | Automated plan/apply pipeline |
| 10 | Complete Project | ⬜ Planned | Full production architecture |

---

## 🏗️ Tech Stack

![Terraform](https://img.shields.io/badge/Terraform-1.15.1-7B42BC?logo=terraform)
![AWS](https://img.shields.io/badge/AWS-eu--west--2-FF9900?logo=amazonaws)
![GitHub Actions](https://img.shields.io/badge/GitHub_Actions-CI%2FCD-2088FF?logo=githubactions)
![Fedora](https://img.shields.io/badge/Fedora-42-51A2DA?logo=fedora)

---

## 📁 Repository Structure

    terraform-learning/
    ├── .github/
    │   └── workflows/
    │       └── exercise-02.yml    ← CI/CD pipeline
    ├── exercise-00-first-steps/
    ├── exercise-01-minimal-ec2/
    ├── exercise-02-variables-outputs/
    └── README.md

---

## 🚀 Exercise 02 — Variables and Outputs

Most recent completed exercise. Refactored Exercise 01 code
so nothing is hardcoded.

### Infrastructure Created
- VPC with public subnet
- EC2 instance (Ubuntu 24.04)
- Security group (SSH + HTTP + HTTPS)
- Internet Gateway and Route Table
- SSH key pair

### Key Patterns Used

**Data source for AMI — no hardcoded IDs:**
```hcl
data "aws_ami" "ubuntu" {
  most_recent = true
  owners      = ["099720109477"]
  filter {
    name   = "name"
    values = ["ubuntu-pro-server/images/hvm-ssd-gp3/ubuntu-noble-24.04-amd64-pro-*"]
  }
}
```

**Locals for consistent naming:**
```hcl
locals {
  exercise    = "exer-02"
  name_prefix = "sqp-${local.exercise}"
}
```

**Merge for tags:**
```hcl
tags = merge(local.common_tags, {
  Name = "vpc-${local.name_prefix}"
})
```

### How to Run
```bash
# Clone repo
git clone git@github.com:Jano-sqpDev/terraform-learning.git

# Navigate to exercise
cd exercise-02-variables-outputs

# Copy and fill in variables
cp terraform.tfvars.example terraform.tfvars

# Deploy
terraform init
terraform plan
terraform apply

# Destroy when done
terraform destroy
```

### Outputs
```bash
public_ip    = "xx.xx.xx.xx"
instance_id  = "i-xxxxxxxxx"
ssh_command  = "ssh -i ~/.ssh/aws_key ubuntu@xx.xx.xx.xx"
website_url  = "http://xx.xx.xx.xx"
```

---

## ⚙️ CI/CD Pipeline

GitHub Actions workflow automatically:

| Event | Action |
|---|---|
| Pull Request | Runs terraform fmt, validate, plan |
| Merge to main | Runs terraform apply |

---

## 🔑 Key Lessons Learned

- Always use `.id` when referencing Terraform resources
- Security groups are explicit — nothing open by default
- Always `terraform destroy` after practice — protect AWS bill
- AMI name patterns differ per region — use AWS CLI to discover
- `variables.tf` declares, `terraform.tfvars` assigns values
- `locals` for computed values, `variables` for external input
- File separation keeps code clean — `main.tf`, `data.tf`, `key.tf`
- Never use `file()` with local paths in CI/CD pipelines
- Store sensitive values as GitHub Secrets

---

## 👤 About

Transitioning from VFX (Compositing) & IT into DevOps engineering.
Building hands-on AWS infrastructure experience with Terraform.

[![LinkedIn](https://img.shields.io/badge/LinkedIn-Connect-0077B5?logo=linkedin)](https://linkedin.com/in/yourprofile)
[![GitHub](https://img.shields.io/badge/GitHub-Follow-181717?logo=github)](https://github.com/Jano-sqpDev)
