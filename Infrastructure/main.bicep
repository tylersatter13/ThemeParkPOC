
 module resourcegroup 'Modules/addResourceGroup.bicep' = {
   name: 'theme-park-rg'
   params: {
     name: 'theme-park-rg'
     location: 'westus2'
     exists: false
   }
 }
