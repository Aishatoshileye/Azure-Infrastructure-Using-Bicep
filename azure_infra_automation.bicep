// azure_infra_automation.bicep

// This is a consolidated orchestration template that references monitoring, security, and access-control modules.

// Importing monitoring module
module monitoring './modules/monitoring.bicep' = {
  name: 'monitoringModule'
  params: {
    // Add parameters for the monitoring module
  }
}

// Importing security module
module security './modules/security.bicep' = {
  name: 'securityModule'
  params: {
    // Add parameters for the security module
  }
}

// Importing access control module
module accessControl './modules/access-control.bicep' = {
  name: 'accessControlModule'
  params: {
    // Add parameters for the access control module
  }
}