@description('Specifies the name of the App Configuration store.')
param configStoreName string

@description('Specifies the location of the App Configuration store. Defaults to the resource group location.')
param location string = resourceGroup().location

@description('Specifies the tags of the App Configuration store.')
param tags object = {}

@description('Specifies the SKU of the App Configuration store.')
param sku object = {
  name: 'Standard'
}
//@description('Specifies the identity of the App Configuration store.')
//param identity object = {}
@description('Indicates whether the configuration store need to be recovered.')
@allowed(['Default', 'Recover'])
param createMode string = 'Default'

@description('Disables all authentication methods other than AAD authentication.')
param disableLocalAuth bool = false

@description('Property specifying whether protection against purge is enabled for this configuration store.')
param enablePurgeProtection bool = false

@description('The amount of time in days that the configuration store will be retained when it is soft deleted.')
@allowed([1,2,3,4,5,6,7])
param softDeleteRetentionInDays int = 7

/*type KeyVaultProperties = {
  @description('The client id of the identity which will be used to access key vault.')
  identityClientId: string
  @description('The URI of the key vault key used to encrypt data.')
  keyIdentifier: string
}
/*
param keyVaultProperties KeyVaultProperties = {
  identityClientId: ''
  keyIdentifier: ''
}*/

@allowed(['Enabled', 'Disabled'])
param publicNetworkAccess string = 'Enabled'

resource symbolicname 'Microsoft.AppConfiguration/configurationStores@2023-03-01' = {
  name: configStoreName
  location: location
  tags: tags
  sku: sku
  //identity:identity
  properties: {
    createMode: createMode
    disableLocalAuth: disableLocalAuth
    enablePurgeProtection: enablePurgeProtection
    /*encryption: {
      keyVaultProperties: keyVaultProperties
    }*/
    publicNetworkAccess: publicNetworkAccess
    softDeleteRetentionInDays: softDeleteRetentionInDays
  }
}
output configStoreName string = symbolicname.name
output configStoreId string = symbolicname.id

