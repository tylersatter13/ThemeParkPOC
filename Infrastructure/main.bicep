
 param keyVaultName string = 'ThemeParkKeyVault'
 param location string = 'westus2'
 
targetScope = 'subscription'
module addResourceGroup './Modules/addResourceGroup.bicep' = {
  name: 'addResourceGroup'
  scope: subscription()
  params: {
    name: 'ThemeParkResourceGroup'
    location: location
    exists: false
  }
}

/* module keyvault 'Modules/keyVault.bicep' = {
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
} */
