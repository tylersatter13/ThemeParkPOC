targetScope='subscription'

param name string
param location string

resource newRG 'Microsoft.Resources/resourceGroups@2023-07-01' =  {
  name: name
  location: location
}
 output resourcegroupID string = newRG.id
