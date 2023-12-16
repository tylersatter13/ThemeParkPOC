
param keyVaultName string = 'ThemeParkKeyVault'
param location string = resourceGroup().location
param resourceGroupName string = 'ThemeParkResourceGroup'

module newRG 'Modules/addResourceGroup.bicep' = {
  name: 'newResourceGroup'
  scope: subscription()
  params: {
    name: resourceGroupName
    location: location
  }
}
module keyvault 'Modules/AddKeyVault.bicep' = {
  name: keyVaultName
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
