# NEXT STEPS

## Deployment and Configuration Instructions for Team Charis

### GitHub Secrets Setup
1. Go to the repository settings on GitHub.
2. Navigate to "Secrets and variables".
3. Click on "Actions" and then "New repository secret".
4. Add the following secrets:
   - `AZURE_CLIENT_ID`: Your Azure Service Principal Client ID
   - `AZURE_CLIENT_SECRET`: Your Azure Service Principal Client Secret
   - `AZURE_TENANT_ID`: Your Azure Tenant ID
   - `AZURE_SUBSCRIPTION_ID`: Your Azure Subscription ID

### Service Principal Creation
1. Open the Azure Cloud Shell or your local terminal.
2. Execute the following command to create a Service Principal:
   ```bash
   az ad sp create-for-rbac --name "TeamCharisSP" --role Contributor --scopes /subscriptions/{your-subscription-id}
   ```
3. Note the `appId`, `password`, and `tenant` outputs; these are your Client ID, Secret, and Tenant ID respectively.

### Deployment Commands
To deploy the Bicep templates, use the following commands:
1. Log in to Azure:
   ```bash
   az login
   ```
2. Set the subscription:
   ```bash
   az account set --subscription {your-subscription-id}
   ```
3. Deploy the Bicep file:
   ```bash
   az deployment group create --resource-group {your-resource-group} --template-file {path-to-your-bicep-file} --parameters {your-parameters}
   ```

### Monitoring Steps
- Monitor the deployment status using the Azure Portal.
- Check the resource group to see if resources have been created successfully.
- For ongoing monitoring, consider using Azure Monitor or Application Insights.

---

*Document created on 2026-03-28 11:24:42 UTC*