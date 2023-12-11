@description('Specifies the name of the App Configuration store.')
param configStoreName string

resource configStore 'Microsoft.AppConfiguration/configurationStores@2021-10-01-preview' existing = {
  name: configStoreName
}
@description('Specifies the names of the key-value resources. The name is a combination of key and label with $ as delimiter. The label is optional.')
param keyValueNames array = [
  'myKey'
  'myKey$myLabel'
]
@description('Specifies the values of the key-value resources. It\'s optional')
param keyValueValues array = [
  'Key-value without label'
  'Key-value with label'
]


@description('Specifies the content type of the key-value resources. For feature flag, the value should be application/vnd.microsoft.appconfig.ff+json;charset=utf-8. For Key Value reference, the value should be application/vnd.microsoft.appconfig.keyvaultref+json;charset=utf-8. Otherwise, it\'s optional.')
param contentType string = 'application/vnd.microsoft.appconfig.ff+json;charset=utf-8'

@description('Adds tags for the key-value resources. It\'s optional')
param tags object = {
  tag1: 'tag-value-1'
  tag2: 'tag-value-2'
}

resource configStoreKeyValue 'Microsoft.AppConfiguration/configurationStores/keyValues@2021-10-01-preview' = [for (item, i) in keyValueNames: {
  parent: configStore
  name: item
  properties: {
    value: keyValueValues[i]
    contentType: contentType
    tags: tags
  }
}]
