<div align="center">

# ☁️ Tf-monolithic-LZ

### Terraform-based Azure Monolithic Infrastructure

![Terraform](https://img.shields.io/badge/Terraform-%3E%3D1.0.0-7B42BC?logo=terraform&logoColor=white)
![Azure](https://img.shields.io/badge/Azure-Infrastructure-0078D4?logo=microsoftazure&logoColor=white)
![AzureRM](https://img.shields.io/badge/AzureRM-v5.2.0-0078D4?logo=microsoftazure&logoColor=white)
![CI/CD](https://img.shields.io/badge/CI%2FCD-GitHub%20Actions-2088FF?logo=githubactions&logoColor=white)
![License](https://img.shields.io/badge/License-GPL--3.0-blue)

**A modular Azure Infrastructure-as-Code project built with Terraform, following a Parent–Child module architecture and automated through CI/CD.**

</div>

---

## 🌟 Overview

**Tf-monolithic-LZ** is an Azure Infrastructure-as-Code repository designed to provision and manage cloud infrastructure using **Terraform**.

The project uses a structured **Parent → Child module architecture** to keep infrastructure reusable, maintainable, and easy to extend.

The repository includes:

- 🏗️ Reusable Terraform modules
- ☁️ Azure networking and compute infrastructure
- 🔐 Azure Key Vault integration
- 🛡️ Network security controls
- 🌍 Environment-specific configuration
- ⚙️ Automated Terraform CI/CD workflow
- 📋 Terraform validation and planning

---

## 🏛️ Architecture

```text
                         ┌──────────────────────────┐
                         │      GitHub Repository   │
                         │      Tf-monolithic-LZ     │
                         └────────────┬─────────────┘
                                      │
                                      ▼
                         ┌──────────────────────────┐
                         │      GitHub Actions      │
                         │                          │
                         │  Terraform Init          │
                         │  Terraform Validate      │
                         │  Terraform Plan          │
                         │  Terraform Apply         │
                         └────────────┬─────────────┘
                                      │
                                      ▼
                         ┌──────────────────────────┐
                         │      Terraform Root      │
                         │     environment/dev      │
                         └────────────┬─────────────┘
                                      │
                         ┌────────────┼────────────┐
                         │            │            │
                         ▼            ▼            ▼
                    ┌─────────┐ ┌─────────┐ ┌─────────┐
                    │   VNet  │ │   NSG   │ │ KeyVault│
                    └────┬────┘ └─────────┘ └─────────┘
                         │
              ┌──────────┼──────────┐
              ▼          ▼          ▼
          ┌────────┐ ┌────────┐ ┌────────┐
          │ Subnet │ │  NIC   │ │  VM    │
          └────────┘ └────────┘ └────────┘
```

> The architecture can be extended with additional Azure services by adding reusable modules under the `Module` directory.

---

## 📁 Repository Structure

```text
Tf-monolithic-LZ/
│
├── .github/
│   └── workflows/
│       └── terraform.yml
│
├── Module/
│   ├── Azurerm_Vnet/
│   ├── Azurerm_subnet/
│   ├── Azurerm_nsg/
│   ├── Azurerm_pip/
│   ├── Azurerm_nic/
│   ├── Azurerm_vm/
│   ├── Azurerm_keyvault/
│   └── ...
│
├── environment/
│   └── dev/
│       ├── main.tf
│       ├── variables.tf
│       ├── outputs.tf
│       └── terraform.tfvars
│
├── .gitignore
├── LICENSE
└── README.md
```

---

## 🧩 Module-Based Design

The project separates infrastructure into reusable child modules.

### Parent Module

The environment configuration acts as the **parent**, coordinating the deployment of individual resources.

```text
environment/dev
       │
       ├── Resource Group
       │
       ├── VNet
       │    └── Subnet
       │
       ├── NSG
       │
       ├── Public IP
       │
       ├── NIC
       │
       ├── VM
       │
       └── Key Vault
```

### Child Modules

Each module is responsible for a specific Azure resource or infrastructure component.

This approach provides:

- ♻️ Reusability
- 🧹 Cleaner code
- 🔧 Easier maintenance
- 📈 Better scalability
- 👥 Better collaboration
- 🔐 Consistent configuration

---

## ☁️ Azure Infrastructure

The project is designed around core Azure infrastructure components.

| Component | Purpose |
|---|---|
| **Resource Group** | Logical container for Azure resources |
| **Virtual Network** | Provides private network connectivity |
| **Subnet** | Segments the virtual network |
| **NSG** | Controls network traffic |
| **Public IP** | Provides public connectivity where required |
| **NIC** | Connects compute resources to the network |
| **Virtual Machine** | Provides compute capacity |
| **Key Vault** | Securely stores secrets and sensitive configuration |

---

## 🔐 Security

Security is an important part of the infrastructure design.

The project incorporates Azure-native security capabilities such as:

- 🔒 Network Security Groups
- 🔑 Azure Key Vault
- 🛡️ Controlled network access
- 🔐 Secure secret management
- 👤 Azure RBAC / identity-based access where applicable
- 🚫 Sensitive Terraform files excluded through `.gitignore`

**Secrets and credentials should never be committed directly to the repository.**

---

## 🔄 Terraform Workflow

Infrastructure changes follow the standard Terraform workflow:

```text
          Terraform Code
                │
                ▼
        ┌───────────────┐
        │ terraform init │
        └───────┬───────┘
                │
                ▼
      ┌───────────────────┐
      │ terraform validate│
      └─────────┬─────────┘
                │
                ▼
       ┌─────────────────┐
       │ terraform plan  │
       └────────┬────────┘
                │
                ▼
       ┌─────────────────┐
       │ terraform apply │
       └────────┬────────┘
                │
                ▼
        ☁️ Azure Resources
```

### Initialize

```bash
terraform init
```

### Validate

```bash
terraform validate
```

### Format

```bash
terraform fmt -recursive
```

### Plan

```bash
terraform plan
```

### Apply

```bash
terraform apply
```

---

## ⚙️ CI/CD

The repository includes a GitHub Actions workflow under:

```text
.github/workflows/
```

The pipeline can automate the Terraform lifecycle:

```text
Git Push
   │
   ▼
GitHub Actions
   │
   ├── Checkout
   │
   ├── Terraform Setup
   │
   ├── Terraform Init
   │
   ├── Terraform Validate
   │
   ├── Terraform Plan
   │
   └── Terraform Apply
          │
          ▼
       Microsoft Azure
```

This allows infrastructure changes to be version-controlled, reviewed, validated, and deployed consistently.

---

## 🌍 Environment Management

Environment-specific Terraform configuration is maintained under:

```text
environment/
└── dev/
```

This structure allows additional environments to be introduced without redesigning the entire repository.

For example:

```text
environment/
├── dev/
├── test/
└── prod/
```

Each environment can maintain its own variables and configuration while reusing the same child modules.

---

## 🚀 Getting Started

### Prerequisites

Install the following tools:

- [Terraform](https://developer.hashicorp.com/terraform)
- [Azure CLI](https://learn.microsoft.com/cli/azure/)
- Git
- An Azure subscription
- Appropriate Azure permissions

Verify Terraform:

```bash
terraform version
```

Verify Azure CLI:

```bash
az version
```

Authenticate with Azure:

```bash
az login
```

---

## 🛠️ Deployment

Move into the environment directory:

```bash
cd environment/dev
```

Initialize Terraform:

```bash
terraform init
```

Validate the configuration:

```bash
terraform validate
```

Create an execution plan:

```bash
terraform plan
```

Deploy the infrastructure:

```bash
terraform apply
```

---

## 🧪 Pre-Commit Checklist

Before pushing Terraform changes:

```bash
terraform fmt -recursive
terraform init
terraform validate
terraform plan
```

Make sure:

- ✅ Terraform formatting passes
- ✅ Configuration is valid
- ✅ No secrets are committed
- ✅ The Terraform plan has been reviewed
- ✅ Module changes are tested

---

## 📊 Project Status

| Area | Status |
|---|---|
| Terraform | ✅ Implemented |
| Azure Infrastructure | ✅ Implemented |
| Modular Architecture | ✅ Implemented |
| Development Environment | ✅ Configured |
| Key Vault | ✅ Integrated |
| CI/CD Workflow | ✅ Configured |
| Documentation | ✅ Maintained |

---

## 💡 Design Principles

This repository follows four main Infrastructure-as-Code principles:

**Modularity**  
Infrastructure is broken into reusable Terraform modules.

**Consistency**  
The same Terraform patterns can be reused across environments.

**Security**  
Azure-native security controls and secure secret management are preferred.

**Automation**  
Infrastructure changes can be validated and deployed through CI/CD.

---

## 📜 License

This project is licensed under the **GNU General Public License v3.0**.

See the [`LICENSE`](LICENSE) file for details.

---

<div align="center">

### ☁️ Terraform • Azure • Infrastructure as Code • DevOps

**Build → Validate → Plan → Deploy 🚀**

</div>
