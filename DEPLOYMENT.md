## Deployment Guide

This guide provides step-by-step instructions for deploying Azure infrastructure using Bicep templates.

## Prerequisites

Ensure you have the following installed and configured:
- Azure CLI (version 2.40.0 or later)
- Bicep CLI (install using `az bicep install`)
- An active Azure subscription
- Appropriate permissions to create resources

## Deployment Steps

### Step 1: Authenticate with Azure

```bash
az login

This will open a browser window for you to sign in with your Azure credentials.

Step 2: Set the Subscription
bash
az account set --subscription "<subscription-id>"
Step 3: Create a Resource Group
bash
az group create --name myResourceGroup --location eastus
Step 4: Validate the Bicep Template
Before deploying, validate the template:

bash
az bicep lint main.bicep
Step 5: Deploy the Infrastructure
Deploy using the main Bicep template:

bash
az deployment group create \
  --resource-group myResourceGroup \
  --template-file main.bicep \
  --parameters parameters.dev.bicepparam
Step 6: Verify the Deployment
Check the deployment status:

bash
az deployment group show \
  --name myDeployment \
  --resource-group myResourceGroup

  
Troubleshooting

Common Issues and Solutions
Issue: Authentication failed
Solution: Run az login again and ensure you're using the correct credentials.

Issue: Template validation error
Solution: Run az bicep build main.bicep to check for syntax errors.

Issue: Resource already exists
Solution: Update the resource names in your parameter files with unique values.

Cleanup
To remove all deployed resources:

bash
az group delete --name myResourceGroup --yes --no-wait
