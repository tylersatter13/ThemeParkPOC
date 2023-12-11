targetScope='subscription'

param exists bool
param name string
param location string



resource newRG 'Microsoft.Resources/resourceGroups@2022-09-01' = if(exists) {
  name: name
  location: location
}
