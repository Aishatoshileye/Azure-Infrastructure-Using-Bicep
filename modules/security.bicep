// Azure Policy definition for allowed VM SKUs
resource allowedVmSkus 'Microsoft.Authorization/policyDefinitions@2020-09-01' = {
  name: 'allowed-vm-skus'
  properties: {
    displayName: 'Allowed Virtual Machine SKUs'
    policyType: 'Custom'
    mode: 'Indexed'
    parameters: {
      listOfAllowedSKUs: {
        type: 'Array'
        defaultValue: [
          'Standard_B1s',
          'Standard_B2s',
          'Standard_D2s_v3'
        ]
      }
    }
    policyRule: {
      if: {
        allOf: [
          {
            field: 'type'
            equals: 'Microsoft.Compute/virtualMachines'
          },
          {
            field: 'sku.name'
            notIn: '[parameters('listOfAllowedSKUs')]'
          }
        ]
      }
      then: {
        effect: 'Deny'
      }
    }
  }
}

// Azure Policy definition for storage encryption
resource storageEncryption 'Microsoft.Authorization/policyDefinitions@2020-09-01' = {
  name: 'storage-encryption'
  properties: {
    displayName: 'Require Storage Account Encryption'
    policyType: 'Custom'
    mode: 'Indexed'
    policyRule: {
      if: {
        field: 'type'
        equals: 'Microsoft.Storage/storageAccounts'
      }
      then: {
        effect: 'Deny'
        details: {
          type: 'Microsoft.Storage/storageAccounts/encryption' 
          name: 'encryption' 
          properties: {
            requireEncryption: true
          }
        }
      }
    }
  }
}

// Azure Policy definition for NSG requirements
resource nsgRequirements 'Microsoft.Authorization/policyDefinitions@2020-09-01' = {
  name: 'nsg-requirements'
  properties: {
    displayName: 'Require Network Security Group (NSG) for Subnets'
    policyType: 'Custom'
    mode: 'Indexed'
    policyRule: {
      if: {
        field: 'type'
        equals: 'Microsoft.Network/virtualNetworks'
      }
      then: {
        effect: 'Deny'
        details: {
          type: 'Microsoft.Network/networkSecurityGroups'
          name: 'nsg' 
          properties: {}
        }
      }
    }
  }
}