param webAppLabA string
param location string

resource plan 'Microsoft.Web/serverfarms@2022-03-01' = {
  name: '${webAppLabA}-plan'
  location: location
  sku: {
    name: 'B1'
    tier: 'Basic'
  }
  properties: {
    reserved: false
  }
}

resource webApp 'Microsoft.Web/sites@2022-03-01' = {
  name: webAppLabA
  location: location
  properties: {
    serverFarmId: plan.id
  }
}
