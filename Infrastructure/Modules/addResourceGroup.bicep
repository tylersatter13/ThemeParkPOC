param exists bool
param name string
param location string


resource resourceGroup 'Microsoft.Storage/storageAccounts@2022-09-01' = if (!exists) {
  name: name
  location: location
}
