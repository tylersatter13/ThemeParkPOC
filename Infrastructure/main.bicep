
 param keyVaultName string = 'ThemeParkKeyVault'
 param location string = 'westus2'
 param resourceGroupName string = 'ThemeParkResourceGroup'

targetScope = 'subscription'
//Create the core resource group
module addResourceGroup './Modules/addResourceGroup.bicep' = {
  name: 'addResourceGroup'
  scope: subscription()
  params: {
    name: resourceGroupName
    location: location
  }
}
//Create the key vault inside the resource group
module addKeyVault './Modules/addKeyVault.bicep' = {
  name: 'addKeyVault'
  scope: resourceGroup(resourceGroupName)
  params: {
    keyVaultName: keyVaultName
    location: location
    tenantId: subscription().tenantId
    enablePurgeProtection: true
  }
}

//Create the app configuration store inside the resource group
//and link it to the key vault
module addAppConfig './Modules/addAppConfiguration.bicep' = {
  name: 'addAppConfig'
  scope: resourceGroup(resourceGroupName)
  params: {
    configStoreName: 'ThemeParkAppConfig'
    location: location
  }
}

module addKeyVaultAccessPolicy './Modules/addKeyVaultAccessPolicy.bicep' = {
  name: 'addKeyVaultAccessPolicy'
  scope: resourceGroup(resourceGroupName)
  params: {
    keyVaultName: addKeyVault.outputs.keyVaultName
   // applicationId: addAppConfig.outputs.configStoreId
    tenantId: subscription().tenantId
    objectId: addAppConfig.outputs.configStoreId
    resourceName: addAppConfig.outputs.configStoreName
  }
}
