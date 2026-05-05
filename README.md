# 🚀 DevOps Learning Dashboard

## About Me
- **Background:** VFX (Compositing) & IT
- **Goal:** Junior DevOps Engineer
- **Started:** May 2026
- **OS:** Fedora 42 (Toolbox devops container)

---

## 📊 Overall Progress
- **Exercises Complete:** 2/10
- **Certifications:** 0/3
- **Projects on GitHub:** 1
- **Days learning:** 2

---

## 🗺️ Learning Path

### Phase 1 — Terraform & AWS (Now)
| #   | Exercise                 | Status     | Date       | Difficulty |
| --- | ------------------------ | ---------- | ---------- | ---------- |
| 00  | First Steps — Playground | ✅ Complete | 2026-05-01 | ⭐          |
| 01  | Minimal EC2 with nginx   | ✅ Complete | 2026-05-04 | ⭐          |
| 02  | Variables and Outputs    | ✅ Complete | 2026-05-05 | ⭐          |
| 03  | VPC From Scratch         | ⬜ Planned  |            |            |
| 04  | Code Organisation        | ⬜ Planned  |            |            |
| 05  | Remote State             | ⬜ Planned  |            |            |
| 06  | Modules                  | ⬜ Planned  |            |            |
| 07  | Workspaces               | ⬜ Planned  |            |            |
| 08  | Auto Scaling             | ⬜ Planned  |            |            |
| 09  | GitHub Actions CI/CD     | ⬜ Planned  |            |            |
| 10  | Complete Project         | ⬜ Planned  |            |            |

### Phase 2 — Docker & Containers
| Topic | Status | Notes |
|---|---|---|
| Docker basics | ⬜ Planned | |
| Docker Compose | ⬜ Planned | |
| Container networking | ⬜ Planned | |

### Phase 3 — Kubernetes
| Topic | Status | Notes |
|---|---|---|
| K8s concepts | ⬜ Planned | |
| Deployments | ⬜ Planned | |
| Services & Ingress | ⬜ Planned | |

### Phase 4 — CI/CD
| Topic | Status | Notes |
|---|---|---|
| GitHub Actions | 🔄 In Progress | Next after Exercise 03 |
| Jenkins | ⬜ Planned | |

---

## 🏆 Certifications Roadmap
| Certification | Status | Target Date | Cost |
|---|---|---|---|
| AWS Cloud Practitioner | ⬜ Planned | 2026-08 | ~$100 |
| AWS Solutions Architect Associate | ⬜ Planned | 2026-11 | ~$150 |
| Terraform Associate | ⬜ Planned | 2026-10 | ~$70 |

---

## 🛠️ Tools & Environment
| Tool | Where | Status |
|---|---|---|
| Terraform v1.15.1 | Toolbox devops container | ✅ Ready |
| AWS CLI | Toolbox devops container | ✅ Ready |
| AWS SAM CLI | Toolbox devops container | ✅ Ready |
| Python 3 | Toolbox devops container | ✅ Ready |
| Git | Host | ✅ Ready |
| VS Code | Toolbox devops container | ✅ Ready |
| Chrome | Flatpak | ✅ Ready |
| Thunderbird | Flatpak | ✅ Ready |
| Obsidian | Host | ✅ Ready |
| TickTick | All platforms | ✅ Ready |

---

## 📚 Resources

### Currently Using
- [Terraform AWS Provider Docs](https://registry.terraform.io/providers/hashicorp/aws/latest/docs)
- [AWS Documentation](https://docs.aws.amazon.com)
- [TechWorld with Nana YouTube](https://www.youtube.com/@TechWorldwithNana)
- [HashiCorp Terraform Tutorials](https://developer.hashicorp.com/terraform/tutorials)

### Planned
- Adrian Cantrill AWS courses
- TechWorld with Nana DevOps Bootcamp

---

## 💡 Key Lessons Learned So Far
- Always use `.id` when referencing Terraform resources
- Security groups are explicit — nothing open by default
- Always `terraform destroy` after practice — protect AWS bill
- Flatpak apps are sandboxed from host commands
- Public IP must be explicitly enabled on subnets
- `vpc_security_group_ids` not `security_groups` inside VPC
- AMI name patterns differ per region — use AWS CLI to discover
- Ubuntu 24.04 codename is Noble — affects AMI filter patterns
- `variables.tf` declares, `terraform.tfvars` assigns values
- `locals` for computed values, `variables` for external input
- `merge()` combines two maps — same as Python `{**dict1, **dict2}`
- `data` sources fetch existing AWS info without creating resources
- File separation keeps code clean — `main.tf`, `data.tf`, `key.tf`
- Real errors teach more than tutorials

---

## 📝 Notes & Ideas
- Consider writing a blog post about Fedora 42 + Toolbox setup
- Document VFX background in LinkedIn — rare DevOps angle
- Build GitHub portfolio alongside exercises
- Look into dev.to or Hashnode for technical blog

---

## 🔗 Quick Links
- [[Exercise 00 — First Steps]]
- [[Exercise 01 — Minimal EC2 with nginx]]
- [[Exercise 02 — Variables and Outputs]]
- [[Exercise 03 — VPC From Scratch]]

---

## 📅 Recent Activity
- **2026-05-05** — Completed Exercise 02, learned variables,
  locals, data sources, file separation, AMI discovery
- **2026-05-04** — Completed Exercise 00 playground, set up
  Fedora 42 Toolbox environment
- **2026-05-01** — Completed Exercise 01, deployed first EC2
  on AWS with nginx