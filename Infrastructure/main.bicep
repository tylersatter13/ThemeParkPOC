
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

module keyvault 'Modules/keyVault.bicep' = {
  name: keyVaultName
  scope: resourceGroup(addResourceGroup.name)
  params: {
    keyVaultName: 'ThemeParkKeyVault'
    location: location
    tags: null
    createMode: 'default'
    enableSoftDelete: true
    enablePurgeProtection: true
    enableRbacAuthorization: true
  }
} 
