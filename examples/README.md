# Azure Network Security Groups with Terraform / OpenTofu — Examples

This directory contains **hands-on Azure Network Security Group (NSG) examples** built around the
`terraform-az-fk-nsg` module.

The examples are designed as **progressive building blocks** that introduce how
Azure **Network Security Groups** work in practice — first at the **NIC level** (workload‑scoped security),
and then at the **subnet level** (tier‑scoped security) in combination with **Azure Load Balancer**.

These examples deliberately focus on **network security fundamentals** and avoid
enterprise landing zones, policy frameworks, or platform shortcuts.

They are part of the **[FoggyKitchen.com training ecosystem](https://foggykitchen.com/courses-2/)** and are used across:

- Azure Fundamentals with Terraform / OpenTofu  
- Azure Networking & Security foundations  
- Azure Compute (VM & VMSS) deep dives  
- AKS private networking patterns  
- Multicloud (Azure + OCI) architectural training  

---

## 🧭 Example Overview

| Example | Title | Key Topics |
|--------|-------|------------|
| 01 | **NIC-level Network Security Group (Private Access)** | Workload-scoped NSG, private VM, Azure Bastion access, no public IP |
| 02 | **Subnet-level Network Security Group with Load Balancer** | Subnet-scoped NSG, shared security boundary, Azure Load Balancer integration |

Each example introduces **one clear security boundary concept** and can be applied
**independently** for learning, experimentation, or reuse.

---

## ⚙️ How to Use

Each example directory contains:

- Terraform / OpenTofu configuration (`.tf`)
- A focused `README.md` explaining the architectural goal
- Architecture diagrams and Azure Portal verification screenshots
- A **fully runnable deployment** (no placeholders, no mock resources)

To run an example:

```bash
cd examples/01_nic_level_nsg_private_access
tofu init
tofu plan
tofu apply
```

Examples may be deployed independently, but the **recommended learning path** is:

```
01 → 02
```

This mirrors real‑world Azure platform design:

- Start with **workload‑scoped security boundaries** (NIC‑level NSG)
- Then move to **tier‑scoped security boundaries** (subnet‑level NSG) behind a Load Balancer

---

## 🧩 Design Principles

These examples follow strict design rules:

- One example = one security boundary concept  
- Explicit modeling of:
  - inbound rules
  - source scoping (AzureBastionSubnet, AzureLoadBalancer, Internet)
  - attachment scope (NIC vs subnet)
- Clear separation of concerns:
  - networking (VNet, subnet)
  - security (NSG module)
  - compute (VM / multiple VMs)
  - traffic fan‑in (Load Balancer)
- No hidden magic or implicit wiring  
- All traffic paths are visible in Terraform  

The examples intentionally avoid:

- Enterprise landing zones  
- Azure Firewall / NVA appliances  
- Application Gateway / Front Door  
- Platform‑specific shortcuts  
- Kubernetes abstractions (covered in AKS modules)  

The goal is **clarity and correctness**, not completeness.

---

## 🔗 Related Modules & Training

- terraform-az-fk-nsg (this repository)  
- terraform-az-fk-vnet  
- terraform-az-fk-compute  
- terraform-az-fk-loadbalancer  
- terraform-az-fk-aks  

---

## 🪪 License

Licensed under the **Universal Permissive License (UPL), Version 1.0**.  
See `LICENSE` for details.

---

© 2026 FoggyKitchen.com — Cloud. Code. Clarity.
