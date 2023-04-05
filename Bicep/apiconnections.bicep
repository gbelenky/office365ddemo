targetScope= 'resourceGroup'
param location string = resourceGroup().location
param connName string = 'office365'

var resourceType  = 'Microsoft.Web/locations/managedApis'

resource office365conn 'Microsoft.Web/connections@2016-06-01' = {
  name: connName
  location: location
  kind: 'V2'
  properties: {
    api: {
      brandColor: '#0078D4'
      description: 'Microsoft Office 365 is a cloud-based service that is designed to help meet your organization\'s needs for robust security, reliability, and user productivity.'
      displayName: 'Office 365 Outlook'
      iconUri: 'https://connectoricons-prod.azureedge.net/releases/v1.0.1624/1.0.1624.3220/${connName}/icon.png'
      name: connName
      type: resourceType
      id: subscriptionResourceId('Microsoft.Web/locations/managedApis', location, connName)
    }
  }
}

var validityTimeSpan ={
  validityTimeSpan:'30'
}

var key = office365conn.listConnectionKeys('2018-07-01-preview',validityTimeSpan).connectionKey
output apiKey string = key

var url = office365conn.properties.connectionRuntimeUrl
output connRuntimeUrl string = any(url)

output connName string = office365conn.name


