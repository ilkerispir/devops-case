# Summary: A simple Azure Kubernetes Cluster
# Explanation: Also known as Azure Kubernetes Service (AKS)

# Documentation: https://www.terraform.io/docs/language/settings/index.html
terraform {
  required_version = ">= 1.0.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 2.0"
    }
  }
}

# Documentation: https://www.terraform.io/docs/language/values/variables.html
variable "azure_subscription_id" {
  type = string
}

# Documentation: https://www.terraform.io/docs/language/providers/requirements.html
# Documentation: https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs
provider "azurerm" {
  features {}

  subscription_id = var.azure_subscription_id
}

# Resource Group
# Documentation: https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group
resource "azurerm_resource_group" "ilker_cluster" {
  name     = "ilker-cluster"
  location = "West Europe"
}

# Kubernetes Cluster within the Resource Group
# Documentation: https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster
resource "azurerm_kubernetes_cluster" "changeme_simple_k8s" {
  name                = "ilker-cluster"
  location            = azurerm_resource_group.ilker_cluster.location
  resource_group_name = azurerm_resource_group.ilker_cluster.name

  dns_prefix = "ilker-cluster-dns-prefix"

  identity {
    type = "SystemAssigned"
  }

  default_node_pool {
    name       = "ilkerpool"
    node_count = 2
    vm_size    = "Standard_DS2_v2"
  }
}