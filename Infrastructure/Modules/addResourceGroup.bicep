targetScope='subscription'

param name string
param location string

resource newRG 'Microsoft.Resources/resourceGroups@2022-09-01' =  {
  name: name
  location: location
}
 output resourcegroupID string = newRG.id
