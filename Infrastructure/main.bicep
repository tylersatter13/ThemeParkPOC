
 param keyVaultName string = 'ThemeParkKeyVault'
 param location string = resourceGroup().location

 module keyvault 'Modules/keyVault.bicep' = {
  name: keyVaultName
  params: {
    keyVaultName: 'ThemeParkKeyVault'
    location: resourceGroup().location
    tags: null
    createMode: 'default'
    enableSoftDelete: true
    enablePurgeProtection: true
    enableRbacAuthorization: true
  }
 }
