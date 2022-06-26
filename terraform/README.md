# Azure AKS Terraform

## Azure CLI Login

```bash
az login
```

## GET Azure Subscription ID

```bash
az account show --query "{ subscription_id: id }"
```

## Init AKS Cluster

```bash
./azure run.sh
```

## Destroy AKS Cluster

```bash
./azure destroy.sh
```