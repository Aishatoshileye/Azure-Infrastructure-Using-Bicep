# PARAMETERS.md

## Parameter Documentation

This documentation provides details on the parameters used in the Azure Infrastructure Bicep templates.

### Parameter 1: **location**
- **Type**: string  
- **Default**: `eastus`  
- **Description**: The Azure region where the resources will be deployed.

### Example Usage:
```bicep
param location string = 'eastus'
```

---

### Parameter 2: **resourceGroupName**
- **Type**: string  
- **Description**: The name of the resource group to contain the deployed resources.

### Example Usage:
```bicep
param resourceGroupName string
```

---

### Parameter 3: **adminUsername**
- **Type**: string  
- **Default**: `azureuser`  
- **Description**: The administrator username for virtual machines.

### Example Usage:
```bicep
param adminUsername string = 'azureuser'
```

---

### Additional Parameters
- **databaseName**: Name of the Azure SQL database.
- **sku**: SKU for the resources.

Please refer to the individual Bicep files for more parameters and their details.
