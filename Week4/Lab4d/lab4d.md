@ranipriyanka-cloud ➜ /workspaces/priyanka-cloud-wil/Week4/Lab4c (main) $ az network nsg create \
  --resource-group lab4-rg \
  --name web-nsg \
  --location australiaeast
{
  "NewNSG": {
    "defaultSecurityRules": [
      {
        "access": "Allow",
        "description": "Allow inbound traffic from all VMs in VNET",
        "destinationAddressPrefix": "VirtualNetwork",
        "destinationAddressPrefixes": [],
        "destinationPortRange": "*",
        "destinationPortRanges": [],
        "direction": "Inbound",
        "etag": "W/\"cdc33d02-4c5e-4e69-879c-05002b4ede7b\"",
        "id": "/subscriptions/ef7bf398-50f0-4ac0-a233-43eb9543031c/resourceGroups/lab4-rg/providers/Microsoft.Network/networkSecurityGroups/web-nsg/defaultSecurityRules/AllowVnetInBound",
        "name": "AllowVnetInBound",
        "priority": 65000,
        "protocol": "*",
        "provisioningState": "Succeeded",
        "resourceGroup": "lab4-rg",
        "sourceAddressPrefix": "VirtualNetwork",
        "sourceAddressPrefixes": [],
        "sourcePortRange": "*",
        "sourcePortRanges": [],
        "type": "Microsoft.Network/networkSecurityGroups/defaultSecurityRules"
      },
      {
        "access": "Allow",
        "description": "Allow inbound traffic from azure load balancer",
        "destinationAddressPrefix": "*",
        "destinationAddressPrefixes": [],
        "destinationPortRange": "*",
        "destinationPortRanges": [],
        "direction": "Inbound",
        "etag": "W/\"cdc33d02-4c5e-4e69-879c-05002b4ede7b\"",
        "id": "/subscriptions/ef7bf398-50f0-4ac0-a233-43eb9543031c/resourceGroups/lab4-rg/providers/Microsoft.Network/networkSecurityGroups/web-nsg/defaultSecurityRules/AllowAzureLoadBalancerInBound",
        "name": "AllowAzureLoadBalancerInBound",
        "priority": 65001,
        "protocol": "*",
        "provisioningState": "Succeeded",
        "resourceGroup": "lab4-rg",
        "sourceAddressPrefix": "AzureLoadBalancer",
        "sourceAddressPrefixes": [],
        "sourcePortRange": "*",
        "sourcePortRanges": [],
        "type": "Microsoft.Network/networkSecurityGroups/defaultSecurityRules"
      },
      {
        "access": "Deny",
        "description": "Deny all inbound traffic",
        "destinationAddressPrefix": "*",
        "destinationAddressPrefixes": [],
        "destinationPortRange": "*",
        "destinationPortRanges": [],
        "direction": "Inbound",
        "etag": "W/\"cdc33d02-4c5e-4e69-879c-05002b4ede7b\"",
        "id": "/subscriptions/ef7bf398-50f0-4ac0-a233-43eb9543031c/resourceGroups/lab4-rg/providers/Microsoft.Network/networkSecurityGroups/web-nsg/defaultSecurityRules/DenyAllInBound",
        "name": "DenyAllInBound",
        "priority": 65500,
        "protocol": "*",
        "provisioningState": "Succeeded",
        "resourceGroup": "lab4-rg",
        "sourceAddressPrefix": "*",
        "sourceAddressPrefixes": [],
        "sourcePortRange": "*",
        "sourcePortRanges": [],
        "type": "Microsoft.Network/networkSecurityGroups/defaultSecurityRules"
      },
      {
        "access": "Allow",
        "description": "Allow outbound traffic from all VMs to all VMs in VNET",
        "destinationAddressPrefix": "VirtualNetwork",
        "destinationAddressPrefixes": [],
        "destinationPortRange": "*",
        "destinationPortRanges": [],
        "direction": "Outbound",
        "etag": "W/\"cdc33d02-4c5e-4e69-879c-05002b4ede7b\"",
        "id": "/subscriptions/ef7bf398-50f0-4ac0-a233-43eb9543031c/resourceGroups/lab4-rg/providers/Microsoft.Network/networkSecurityGroups/web-nsg/defaultSecurityRules/AllowVnetOutBound",
        "name": "AllowVnetOutBound",
        "priority": 65000,
        "protocol": "*",
        "provisioningState": "Succeeded",
        "resourceGroup": "lab4-rg",
        "sourceAddressPrefix": "VirtualNetwork",
        "sourceAddressPrefixes": [],
        "sourcePortRange": "*",
        "sourcePortRanges": [],
        "type": "Microsoft.Network/networkSecurityGroups/defaultSecurityRules"
      },
      {
        "access": "Allow",
        "description": "Allow outbound traffic from all VMs to Internet",
        "destinationAddressPrefix": "Internet",
        "destinationAddressPrefixes": [],
        "destinationPortRange": "*",
        "destinationPortRanges": [],
        "direction": "Outbound",
        "etag": "W/\"cdc33d02-4c5e-4e69-879c-05002b4ede7b\"",
        "id": "/subscriptions/ef7bf398-50f0-4ac0-a233-43eb9543031c/resourceGroups/lab4-rg/providers/Microsoft.Network/networkSecurityGroups/web-nsg/defaultSecurityRules/AllowInternetOutBound",
        "name": "AllowInternetOutBound",
        "priority": 65001,
        "protocol": "*",
        "provisioningState": "Succeeded",
        "resourceGroup": "lab4-rg",
        "sourceAddressPrefix": "*",
        "sourceAddressPrefixes": [],
        "sourcePortRange": "*",
        "sourcePortRanges": [],
        "type": "Microsoft.Network/networkSecurityGroups/defaultSecurityRules"
      },
      {
        "access": "Deny",
        "description": "Deny all outbound traffic",
        "destinationAddressPrefix": "*",
        "destinationAddressPrefixes": [],
        "destinationPortRange": "*",
        "destinationPortRanges": [],
        "direction": "Outbound",
        "etag": "W/\"cdc33d02-4c5e-4e69-879c-05002b4ede7b\"",
        "id": "/subscriptions/ef7bf398-50f0-4ac0-a233-43eb9543031c/resourceGroups/lab4-rg/providers/Microsoft.Network/networkSecurityGroups/web-nsg/defaultSecurityRules/DenyAllOutBound",
        "name": "DenyAllOutBound",
        "priority": 65500,
        "protocol": "*",
        "provisioningState": "Succeeded",
        "resourceGroup": "lab4-rg",
        "sourceAddressPrefix": "*",
        "sourceAddressPrefixes": [],
        "sourcePortRange": "*",
        "sourcePortRanges": [],
        "type": "Microsoft.Network/networkSecurityGroups/defaultSecurityRules"
      }
    ],
    "etag": "W/\"cdc33d02-4c5e-4e69-879c-05002b4ede7b\"",
    "id": "/subscriptions/ef7bf398-50f0-4ac0-a233-43eb9543031c/resourceGroups/lab4-rg/providers/Microsoft.Network/networkSecurityGroups/web-nsg",
    "location": "australiaeast",
    "name": "web-nsg",
    "provisioningState": "Succeeded",
    "resourceGroup": "lab4-rg",
    "resourceGuid": "ddd21119-1976-40f8-9360-4d269bf2f98b",
    "securityRules": [],
    "type": "Microsoft.Network/networkSecurityGroups"
  }
}
@ranipriyanka-cloud ➜ /workspaces/priyanka-cloud-wil/Week4/Lab4c (main) $ az network nsg rule create \
  --resource-group lab4-rg \
  --nsg-name web-nsg \
  --name Allow-HTTP \
  --priority 100 \
  --source-address-prefixes '*' \
  --destination-port-ranges 80 \
  --direction Inbound \
  --access Allow \
  --protocol Tcp \
  --description "Allow HTTP traffic"
{
  "access": "Allow",
  "description": "Allow HTTP traffic",
  "destinationAddressPrefix": "*",
  "destinationAddressPrefixes": [],
  "destinationPortRange": "80",
  "destinationPortRanges": [],
  "direction": "Inbound",
  "etag": "W/\"8f4321c6-f4fd-4740-b720-02dee9ec3597\"",
  "id": "/subscriptions/ef7bf398-50f0-4ac0-a233-43eb9543031c/resourceGroups/lab4-rg/providers/Microsoft.Network/networkSecurityGroups/web-nsg/securityRules/Allow-HTTP",
  "name": "Allow-HTTP",
  "priority": 100,
  "protocol": "Tcp",
  "provisioningState": "Succeeded",
  "resourceGroup": "lab4-rg",
  "sourceAddressPrefix": "*",
  "sourceAddressPrefixes": [],
  "sourcePortRange": "*",
  "sourcePortRanges": [],
  "type": "Microsoft.Network/networkSecurityGroups/securityRules"
}
@ranipriyanka-cloud ➜ /workspaces/priyanka-cloud-wil/Week4/Lab4c (main) $ az network vnet subnet update \
  --vnet-name lab4-vnet \
  --name web-subnet \
  --resource-group lab4-rg \
  --network-security-group web-nsg
{
  "addressPrefixes": [
    "10.1.1.0/24"
  ],
  "delegations": [],
  "etag": "W/\"7632273e-b8c8-4f3f-ae48-676ed2553fe4\"",
  "id": "/subscriptions/ef7bf398-50f0-4ac0-a233-43eb9543031c/resourceGroups/lab4-rg/providers/Microsoft.Network/virtualNetworks/lab4-vnet/subnets/web-subnet",
  "name": "web-subnet",
  "networkSecurityGroup": {
    "id": "/subscriptions/ef7bf398-50f0-4ac0-a233-43eb9543031c/resourceGroups/lab4-rg/providers/Microsoft.Network/networkSecurityGroups/web-nsg",
    "resourceGroup": "lab4-rg"
  },
  "privateEndpointNetworkPolicies": "Disabled",
  "privateLinkServiceNetworkPolicies": "Enabled",
  "provisioningState": "Succeeded",
  "resourceGroup": "lab4-rg",
  "type": "Microsoft.Network/virtualNetworks/subnets"
}
@ranipriyanka-cloud ➜ /workspaces/priyanka-cloud-wil/Week4/Lab4c (main) $ cd..
bash: cd..: command not found
@ranipriyanka-cloud ➜ /workspaces/priyanka-cloud-wil/Week4/Lab4c (main) $ cd ..
@ranipriyanka-cloud ➜ /workspaces/priyanka-cloud-wil/Week4 (main) $ cd Lab4d
@ranipriyanka-cloud ➜ /workspaces/priyanka-cloud-wil/Week4/Lab4d (main) $ az deployment group create \
  --resource-group lab4-rg \
  --template-file nsg-deployment.json
{
  "id": "/subscriptions/ef7bf398-50f0-4ac0-a233-43eb9543031c/resourceGroups/lab4-rg/providers/Microsoft.Resources/deployments/nsg-deployment",
  "location": null,
  "name": "nsg-deployment",
  "properties": {
    "correlationId": "6340979b-8d5b-41b0-a501-d56dc6b479e1",
    "debugSetting": null,
    "dependencies": [
      {
        "dependsOn": [
          {
            "id": "/subscriptions/ef7bf398-50f0-4ac0-a233-43eb9543031c/resourceGroups/lab4-rg/providers/Microsoft.Network/networkSecurityGroups/web-nsg",
            "resourceGroup": "lab4-rg",
            "resourceName": "web-nsg",
            "resourceType": "Microsoft.Network/networkSecurityGroups"
          }
        ],
        "id": "/subscriptions/ef7bf398-50f0-4ac0-a233-43eb9543031c/resourceGroups/lab4-rg/providers/Microsoft.Network/virtualNetworks/lab4-vnet/subnets/web-subnet",
        "resourceGroup": "lab4-rg",
        "resourceName": "lab4-vnet/web-subnet",
        "resourceType": "Microsoft.Network/virtualNetworks/subnets"
      }
    ],
    "diagnostics": null,
    "duration": "PT7.8459458S",
    "error": null,
    "mode": "Incremental",
    "onErrorDeployment": null,
    "outputResources": [
      {
        "id": "/subscriptions/ef7bf398-50f0-4ac0-a233-43eb9543031c/resourceGroups/lab4-rg/providers/Microsoft.Network/networkSecurityGroups/web-nsg",
        "resourceGroup": "lab4-rg"
      },
      {
        "id": "/subscriptions/ef7bf398-50f0-4ac0-a233-43eb9543031c/resourceGroups/lab4-rg/providers/Microsoft.Network/virtualNetworks/lab4-vnet/subnets/web-subnet",
        "resourceGroup": "lab4-rg"
      }
    ],
    "outputs": null,
    "parameters": null,
    "parametersLink": null,
    "providers": [
      {
        "id": null,
        "namespace": "Microsoft.Network",
        "providerAuthorizationConsentState": null,
        "registrationPolicy": null,
        "registrationState": null,
        "resourceTypes": [
          {
            "aliases": null,
            "apiProfiles": null,
            "apiVersions": null,
            "capabilities": null,
            "defaultApiVersion": null,
            "locationMappings": null,
            "locations": [
              "australiaeast"
            ],
            "properties": null,
            "resourceType": "networkSecurityGroups",
            "zoneMappings": null
          },
          {
            "aliases": null,
            "apiProfiles": null,
            "apiVersions": null,
            "capabilities": null,
            "defaultApiVersion": null,
            "locationMappings": null,
            "locations": [
              null
            ],
            "properties": null,
            "resourceType": "virtualNetworks/subnets",
            "zoneMappings": null
          }
        ]
      }
    ],
    "provisioningState": "Succeeded",
    "templateHash": "11778640874088684784",
    "templateLink": null,
    "timestamp": "2025-07-04T02:10:52.953826+00:00",
    "validatedResources": null,
    "validationLevel": null
  },
  "resourceGroup": "lab4-rg",
  "tags": null,
  "type": "Microsoft.Resources/deployments"
}
@ranipriyanka-cloud ➜ /workspaces/priyanka-cloud-wil/Week4/Lab4d (main) $ az network vnet subnet show \
  --vnet-name lab4-vnet \
  --name web-subnet \
  --resource-group lab4-rg \
  --query "networkSecurityGroup.id"
"/subscriptions/ef7bf398-50f0-4ac0-a233-43eb9543031c/resourceGroups/lab4-rg/providers/Microsoft.Network/networkSecurityGroups/web-nsg"
@ranipriyanka-cloud ➜ /workspaces/priyanka-cloud-wil/Week4/Lab4d (main) $ az network nsg rule list \
  --resource-group lab4-rg \
  --nsg-name web-nsg \
  --output table
Name        ResourceGroup    Priority    SourcePortRanges    SourceAddressPrefixes    SourceASG    Access    Protocol    Direction    DestinationPortRanges    DestinationAddressPrefixes    DestinationASG
----------  ---------------  ----------  ------------------  -----------------------  -----------  --------  ----------  -----------  -----------------------  ----------------------------  ----------------
Allow-HTTP  lab4-rg          100         *                   *                        None         Allow     Tcp         Inbound      80                       *                             None
@ranipriyanka-cloud ➜ /workspaces/priyanka-cloud-wil/Week4/Lab4d (main) $ 