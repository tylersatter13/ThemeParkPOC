
param createMode CreateMode = 'default'
param keyVaultName string
param location string = resourceGroup().location
param enabledForDeployment bool = true
param enabledForDiskEncryption bool = true
param enabledForTemplateDeployment bool = true
param enablePurgeProtection bool = true
param enableRbacAuthorization bool = true
param enableSoftDelete bool = false
param softDeleteRetentionInDays int = 90
param tags object = {}
param accessPolicies  AccessPolicyEntry[] = []
param networkAcls NetworkAcls = {
  bypass: 'AzureServices'
  defaultAction: 'Allow'
  ipRules: []
  virtualNetworkRules: []
}
param provisioningState ProvisioningState = 'Succeeded'
param publicNetworkAccess PublicNetworkAccess = 'Enabled'
param sku Sku = {
  family: 'A'
  name: 'standard'
}
param tenantId string = subscription().tenantId
param valutUri string = concat('https://', keyVaultName, '.vault.azure.net')
type CreateMode = 'recover' | 'default' 


type AccessPolicyEntry = {
  applicationId: string
  objectId: string
  permissions: {
    certificates: KeyVaultCertificate[]
    keys: KeyVaultKey[]
    secrets: KeyVaultSecret[]
    storage: string[]
  }
  tenantId: string
}

type KeyVaultKey = 'all' | 'backup' | 'create' | 'decrypt' | 'delete' | 'encrypt' | 'get' | 'getrotationpolicy' | 'import' | 'list' | 'purge' | 'recover' | 'release' | 'restore' | 'rotate' | 'setrotationpolicy' | 'sign' | 'unwrapKey' | 'update' | 'verify' | 'wrapKey' 
type KeyVaultSecret = 'all' | 'backup' | 'delete' | 'get' | 'list' | 'purge' | 'recover' | 'restore' | 'set'
type KeyVaultCertificate = 'all' | 'backup' | 'create' | 'delete' | 'deleteissuers' | 'get' | 'getissuers' | 'import' | 'list' | 'listissuers' | 'managecontacts' | 'manageissuers' | 'purge' | 'recover' | 'restore' | 'setissuers' | 'update'

// NetworkAcls
type NetworkAcls = {
  bypass: 'AzureServices' | 'None'
  defaultAction: 'Allow' | 'Deny'
  ipRules: IpRule[]
  virtualNetworkRules: VirtualNetworkRule[]
}
type IpRule = {
  value: string
}
type VirtualNetworkRule = {
  id: string
  ignoreMissingVnetServiceEndpoint: bool
}
type ProvisioningState = 'RegisteringDns' | 'Succeeded'
type PublicNetworkAccess = 'Enabled' | 'Disabled' 

type Sku = {
  family: string
  name: skuName
}
type skuName = 'premium' | 'standard'

resource keyvault 'Microsoft.KeyVault/vaults@2022-07-01' = {
  name: keyVaultName
  location: location
  tags: tags
  properties: {
    accessPolicies: accessPolicies
    createMode: createMode
    enabledForDeployment: enabledForDeployment
    enabledForDiskEncryption: enabledForDiskEncryption
    enabledForTemplateDeployment: enabledForTemplateDeployment
    enablePurgeProtection: enablePurgeProtection
    enableRbacAuthorization: enableRbacAuthorization
    enableSoftDelete: enableSoftDelete
    networkAcls: networkAcls
    provisioningState: provisioningState
    publicNetworkAccess: publicNetworkAccess
    sku: sku
    softDeleteRetentionInDays: softDeleteRetentionInDays
    tenantId: tenantId
    vaultUri: valutUri
  }
}
output keyVaultName string = keyvault.name
output keyVaultId string = keyvault.id
