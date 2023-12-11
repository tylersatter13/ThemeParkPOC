@description('Specifies the name of the App Configuration store.')
param configStoreName string
param keyValueNames array
param keyValueValues array
param tags object

module myAppConfigValue 'setAppConfigKeyValue.bicep' = {
  name: 'myAppConfigValue'
  params: {
    configStoreName: configStoreName
    keyValueNames: keyValueNames
    keyValueValues:keyValueValues
    contentType: 'application/vnd.microsoft.appconfig.keyvaultref+json;charset=utf-8'
    tags: tags
  }
}

 