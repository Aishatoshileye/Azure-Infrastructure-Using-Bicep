@module
param keyVaultName string
param location string
param secretName string

// Create an Azure Key Vault
resource keyVault 'Microsoft.KeyVault/vaults@2021-04-01' = {
  name: keyVaultName
  location: location
  properties: {
    sku: {
      family: 'A'
      name: 'standard'
    }
    tenantId: subscription().tenantId
    accessPolicies: []
  }
}

// Setup secrets management by creating a secret
resource secret 'Microsoft.KeyVault/vaults/secrets@2021-04-01' = {
  name: secretName
  parent: keyVault
  properties: {
    value: 'your-secret-value' // Add secret value
  }
}

// Configure Role-Based Access Control (RBAC)
resource kvAccessPolicy 'Microsoft.Authorization/roleAssignments@2020-04-01-preview' = [
  for user in ['<your-user-email>']: {
    name: guid(keyVault.id, user)
    properties: {
      principalId: user
      roleDefinitionId: '/providers/microsoft.authorization/roleDefinitions/<role-definition-id>'
      scope: keyVault.id
    }
  }
]
