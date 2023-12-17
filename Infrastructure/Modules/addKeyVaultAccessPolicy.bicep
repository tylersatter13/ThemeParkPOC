param certificatePermissions CertificatePermissions[] = []
type CertificatePermissions = 'get' | 'list'| 'delete'|'create'|'import'|'update'|'managecontacts'|'getissuers'|'listissuers'|'setissuers'|'deleteissuers'|'manageissuers'|'recover'|'purge'

param keyPermissions KeyPermissions[] = []
type KeyPermissions = 'encrypt' | 'decrypt' | 'wrapKey' | 'unwrapKey' | 'sign' | 'verify' | 'get' | 'list' | 'create' | 'update' | 'import' | 'delete' | 'backup' | 'restore' | 'recover' | 'purge'

param secretPermissions SecretPermissions[] = []
type SecretPermissions = 'get' | 'list' | 'set' | 'delete' | 'backup' | 'restore' | 'recover' | 'purge'

param storagePermissions StoragePermissions[] = []
type StoragePermissions = 'get' | 'list' | 'delete' | 'set' | 'update' | 'regeneratekey' | 'recover' | 'purge'

//param applicationId string
param objectId string
param tenantId string

param keyVaultName string
param resourceName string
resource keyVaultExisting 'Microsoft.KeyVault/vaults@2023-07-01' existing = {
  name: keyVaultName
}

resource keyVaultPolicy 'Microsoft.KeyVault/vaults/accessPolicies@2022-07-01' = {
  name: resourceName
  parent: keyVaultExisting
  properties: {
    accessPolicies: [
      {
        objectId: objectId
        permissions: {
          certificates: certificatePermissions
          keys: keyPermissions
          secrets: secretPermissions
          storage: storagePermissions
        }
        tenantId: tenantId
      }
    ]
  }
}
