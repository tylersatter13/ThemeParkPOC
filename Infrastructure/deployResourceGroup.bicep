
 param keyVaultName string = 'ThemeParkKeyVault'
 param location string = 'westus2'
 param resourceGroupName string = 'ThemeParkResourceGroup'

targetScope = 'subscription'
module addResourceGroup './Modules/addResourceGroup.bicep' = {
  name: 'addResourceGroup'
  scope: subscription()
  params: {
    name: resourceGroupName
    location: location
    exists: false
  }
}
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
