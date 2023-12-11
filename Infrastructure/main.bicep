
 module resourcegroup 'Modules/addResourceGroup.bicep' = {
   name: 'theme-park-rg'
   scope: subscription()
   params: {
     name: 'theme-park-rg'
     location: 'westus2'
     exists: false
   }
 }
