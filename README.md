# rg-assignment

This repository contains a Terraform configuration to deploy the following Azure resources using modules:

- **Key Vault**
  - Region: Canada East
  - Public network access **disabled**
  - Soft delete retention **7 days**
- **Storage Account (LRS)**
  - Region: Canada Central
  - Replication: LRS
  - Public network access **disabled**
- **Storage Account (RA-GRS)**
  - Region: Canada East
  - Replication: RA-GRS
  - Public network access **enabled**
- All resources are tagged with a single tag:
  ```hcl
  env = "dev|qa|stg|prd"
  ```

---

## Repository Structure

```
.
├─ main.tf                  # Root module: creates RGs and calls child modules
├─ variables.tf             # Root input variables (env, project_prefix, locations)
├─ providers.tf             # AzureRM provider configuration
├─ outputs.tf               # Outputs: Key Vault ID/URI and Storage Account IDs
├─ terraform.tfvars         # Variable file
├─ modules/
│  ├─ keyvault/
│  │   ├─ main.tf           # Key Vault resource
│  │   ├─ variables.tf      # Key Vault input variables
│  │   └─ outputs.tf
│  └─ storage_account/
│      ├─ main.tf           # Storage Account resource
│      ├─ variables.tf      # Storage Account input variables
│      └─ outputs.tf
```

---

## Prerequisites

- [Terraform CLI](https://developer.hashicorp.com/terraform/downloads) installed  
- [Azure CLI](https://learn.microsoft.com/cli/azure/install-azure-cli) installed  
- Logged into Azure with the subscription set:
  ```bash
  az login
  az account set --subscription "<your-subscription-id>"
  ```

---

## Usage

1. **Clone this repository**
   ```bash
   git clone https://github.com/<your-username>/<your-repo>.git
   cd <your-repo>
   ```

2. **Edit `terraform.tfvars`** with your values:
   ```hcl
   env            = "dev"
   project_prefix = "swati01" # must be lowercase and unique for storage accounts
   ```

3. **Initialize Terraform**
   ```bash
   terraform init
   ```

4. **Review the plan**
   ```bash
   terraform plan
   ```

5. **Apply changes**
   ```bash
   terraform apply -auto-approve
   ```

---

## Verification

After apply, verify resources in [Azure Portal](https://portal.azure.com):

- Resource Groups:
  - `<project_prefix>-rg-kv-ce`
  - `<project_prefix>-rg-sa-cc`
  - `<project_prefix>-rg-sa-ce`

- Key Vault (Canada East):
  - Public network access = **Disabled**
  - Soft delete retention = **7 days**

- Storage Account (Canada Central, LRS):
  - Replication = **LRS**
  - Public network access = **Disabled**

- Storage Account (Canada East, RA-GRS):
  - Replication = **RA-GRS**
  - Public network access = **Enabled**

---

## Clean Up

To destroy all resources:
```bash
terraform destroy -auto-approve
```

---
