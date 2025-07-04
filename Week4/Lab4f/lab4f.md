@ranipriyanka-cloud ➜ /workspaces/priyanka-cloud-wil/Week4/Lab4e (main) $ cd ..
@ranipriyanka-cloud ➜ /workspaces/priyanka-cloud-wil/Week4 (main) $ cd Lab4f
@ranipriyanka-cloud ➜ /workspaces/priyanka-cloud-wil/Week4/Lab4f (main) $ az network nic create \
  --resource-group lab4-rg \
  --name lab4-nic \
  --vnet-name lab4-vnet \
  --subnet web-subnet \
  --network-security-group web-nsg
{
  "NewNIC": {
    "auxiliaryMode": "None",
    "auxiliarySku": "None",
    "disableTcpStateTracking": false,
    "dnsSettings": {
      "appliedDnsServers": [],
      "dnsServers": [],
      "internalDomainNameSuffix": "iwisdrt3fvrevkc0d2ksdye2th.px.internal.cloudapp.net"
    },
    "enableAcceleratedNetworking": false,
    "enableIPForwarding": false,
    "etag": "W/\"44e7637c-4109-4dc2-a0a6-89a0d70c0ee3\"",
    "hostedWorkloads": [],
    "id": "/subscriptions/ef7bf398-50f0-4ac0-a233-43eb9543031c/resourceGroups/lab4-rg/providers/Microsoft.Network/networkInterfaces/lab4-nic",
    "ipConfigurations": [
      {
        "etag": "W/\"44e7637c-4109-4dc2-a0a6-89a0d70c0ee3\"",
        "id": "/subscriptions/ef7bf398-50f0-4ac0-a233-43eb9543031c/resourceGroups/lab4-rg/providers/Microsoft.Network/networkInterfaces/lab4-nic/ipConfigurations/ipconfig1",
        "name": "ipconfig1",
        "primary": true,
        "privateIPAddress": "10.1.1.4",
        "privateIPAddressVersion": "IPv4",
        "privateIPAllocationMethod": "Dynamic",
        "provisioningState": "Succeeded",
        "resourceGroup": "lab4-rg",
        "subnet": {
          "id": "/subscriptions/ef7bf398-50f0-4ac0-a233-43eb9543031c/resourceGroups/lab4-rg/providers/Microsoft.Network/virtualNetworks/lab4-vnet/subnets/web-subnet",
          "resourceGroup": "lab4-rg"
        },
        "type": "Microsoft.Network/networkInterfaces/ipConfigurations"
      }
    ],
    "location": "australiaeast",
    "name": "lab4-nic",
    "networkSecurityGroup": {
      "id": "/subscriptions/ef7bf398-50f0-4ac0-a233-43eb9543031c/resourceGroups/lab4-rg/providers/Microsoft.Network/networkSecurityGroups/web-nsg",
      "resourceGroup": "lab4-rg"
    },
    "nicType": "Standard",
    "provisioningState": "Succeeded",
    "resourceGroup": "lab4-rg",
    "resourceGuid": "e1487b30-857b-4872-b2ba-47925a39a8b1",
    "tapConfigurations": [],
    "type": "Microsoft.Network/networkInterfaces",
    "vnetEncryptionSupported": false
  }
}
@ranipriyanka-cloud ➜ /workspaces/priyanka-cloud-wil/Week4/Lab4f (main) $ ADMIN_PASSWORD=P@ssword@$RANDOM
@ranipriyanka-cloud ➜ /workspaces/priyanka-cloud-wil/Week4/Lab4f (main) $ az vm create \
  --resource-group lab4-rg \
  --name lab4-vm \
  --nics lab4-nic \
  --image Ubuntu2204 \
  --size Standard_B1s \
  --admin-username azureuser \
  --admin-password "$ADMIN_PASSWORD" \
  --authentication-type password \
  --output json

The default value of '--size' will be changed to 'Standard_D2s_v5' from 'Standard_DS1_v2' in a future release.
{
  "fqdns": "",
  "id": "/subscriptions/ef7bf398-50f0-4ac0-a233-43eb9543031c/resourceGroups/lab4-rg/providers/Microsoft.Compute/virtualMachines/lab4-vm",
  "location": "australiaeast",
  "macAddress": "60-45-BD-C4-49-70",
  "powerState": "VM running",
  "privateIpAddress": "10.1.1.4",
  "publicIpAddress": "",
  "resourceGroup": "lab4-rg"
}
@ranipriyanka-cloud ➜ /workspaces/priyanka-cloud-wil/Week4/Lab4f (main) $ az network watcher configure \
  --locations australiaeast \
  --resource-group lab4-rg \
  --enabled true
[
  {
    "etag": "W/\"0dadaa65-f04d-446f-9c19-bcb9a45633e2\"",
    "id": "/subscriptions/ef7bf398-50f0-4ac0-a233-43eb9543031c/resourceGroups/NetworkWatcherRG/providers/Microsoft.Network/networkWatchers/NetworkWatcher_australiaeast",
    "location": "australiaeast",
    "name": "NetworkWatcher_australiaeast",
    "provisioningState": "Succeeded",
    "resourceGroup": "NetworkWatcherRG",
    "runningOperationIds": [],
    "type": "Microsoft.Network/networkWatchers"
  }
]
@ranipriyanka-cloud ➜ /workspaces/priyanka-cloud-wil/Week4/Lab4f (main) $ az network watcher list-effective-nsg \
  --resource-group lab4-rg \
  --network-interface lab4-nic \
  --output
'list-effective-nsg' is misspelled or not recognized by the system.

Examples from AI knowledge base:
https://aka.ms/cli_ref
Read more about the command in reference docs
@ranipriyanka-cloud ➜ /workspaces/priyanka-cloud-wil/Week4/Lab4f (main) $ az network nic list-effective-nsg \
  --resource-group lab4-rg \
  --name lab4-nic \
  --output table
NIC       Subnet     NSG      Rule Name                                           Protocol    Direction    Access
--------  ---------  -------  --------------------------------------------------  ----------  -----------  --------
lab4-nic  lab4-vnet  web-nsg  securityRules/Allow-HTTP                            Tcp         Inbound      Allow
                              defaultSecurityRules/AllowVnetInBound               All         Inbound      Allow
                              defaultSecurityRules/AllowAzureLoadBalancerInBound  All         Inbound      Allow
                              defaultSecurityRules/DenyAllInBound                 All         Inbound      Deny
                              defaultSecurityRules/AllowVnetOutBound              All         Outbound     Allow
                              defaultSecurityRules/AllowInternetOutBound          All         Outbound     Allow
                              defaultSecurityRules/DenyAllOutBound                All         Outbound     Deny
@ranipriyanka-cloud ➜ /workspaces/priyanka-cloud-wil/Week4/Lab4f (main) $ az network watcher flow-log configure \
  --resource-group lab4-rg \
  --nsg-name web-nsg \
  --enabled true \
  --storage-account $STORAGE_NAME \
  --retention 7 \
  --traffic-analytics false
'configure' is misspelled or not recognized by the system.

Examples from AI knowledge base:
https://aka.ms/cli_ref
Read more about the command in reference docs
@ranipriyanka-cloud ➜ /workspaces/priyanka-cloud-wil/Week4/Lab4f (main) $ az network watcher flow-log update \
  --resource-group lab4-rg \
  --nsg-name web-nsg \
  --enabled true \
  --storage-account $STORAGE_NAME \
  --retention 7 \
  --traffic-analytics false
argument --storage-account: expected one argument

Examples from AI knowledge base:
az network watcher flow-log update --location westus --resource-group MyResourceGroup --name MyFlowLog --storage-account accountid
Update storage account with ID to let location identify the network watcher

az network watcher flow-log update --location westus --resource-group MyAnotherResourceGroup --name MyFlowLog --nsg MyNSG
Update Network Security Group on another resource group

https://docs.microsoft.com/en-US/cli/azure/network/watcher/flow-log#az_network_watcher_flow_log_update
Read more about the command in reference docs
@ranipriyanka-cloud ➜ /workspaces/priyanka-cloud-wil/Week4/Lab4f (main) $ STORAGE_NAME=lab4storage$RANDOM
@ranipriyanka-cloud ➜ /workspaces/priyanka-cloud-wil/Week4/Lab4f (main) $ 
az storage account create \
  --name $STORAGE_NAME \
  --resource-group lab4-rg \
  --location australiaeast \
  --sku Standard_LRS \
  --kind StorageV2 \
  --enable-hierarchical-namespace false
(SubscriptionNotFound) Subscription ef7bf398-50f0-4ac0-a233-43eb9543031c was not found.
Code: SubscriptionNotFound
Message: Subscription ef7bf398-50f0-4ac0-a233-43eb9543031c was not found.
@ranipriyanka-cloud ➜ /workspaces/priyanka-cloud-wil/Week4/Lab4f (main) $ az account list --output table
Name                CloudName    SubscriptionId                        TenantId                              State    IsDefault
------------------  -----------  ------------------------------------  ------------------------------------  -------  -----------
TAFE-Production     AzureCloud   97b1006a-ca86-4303-b278-42a18379c23c  19537222-55d7-4581-84fb-c2da6e835c74  Enabled  False
Azure for Students  AzureCloud   ef7bf398-50f0-4ac0-a233-43eb9543031c  05440bcf-177c-419d-9948-8297f5966ab4  Enabled  True
@ranipriyanka-cloud ➜ /workspaces/priyanka-cloud-wil/Week4/Lab4f (main) $ az account set --subscription ef7bf398-50f0-4ac0-a233-43eb9543031c
@ranipriyanka-cloud ➜ /workspaces/priyanka-cloud-wil/Week4/Lab4f (main) $ az account show
{
  "environmentName": "AzureCloud",
  "homeTenantId": "05440bcf-177c-419d-9948-8297f5966ab4",
  "id": "ef7bf398-50f0-4ac0-a233-43eb9543031c",
  "isDefault": true,
  "managedByTenants": [],
  "name": "Azure for Students",
  "state": "Enabled",
  "tenantDefaultDomain": "crtc.mq.edu.au",
  "tenantDisplayName": "Macquarie University ",
  "tenantId": "05440bcf-177c-419d-9948-8297f5966ab4",
  "user": {
    "name": "Cloud250310@crtc.mq.edu.au",
    "type": "user"
  }
}
@ranipriyanka-cloud ➜ /workspaces/priyanka-cloud-wil/Week4/Lab4f (main) $ az storage account create \
  --name $STORAGE_NAME \
  --resource-group lab4-rg \
  --location australiaeast \
  --sku Standard_LRS \
  --kind StorageV2 \
  --enable-hierarchical-namespace false
(SubscriptionNotFound) Subscription ef7bf398-50f0-4ac0-a233-43eb9543031c was not found.
Code: SubscriptionNotFound
Message: Subscription ef7bf398-50f0-4ac0-a233-43eb9543031c was not found.
@ranipriyanka-cloud ➜ /workspaces/priyanka-cloud-wil/Week4/Lab4f (main) $ az account list --output table
Name                CloudName    SubscriptionId                        TenantId                              State    IsDefault
------------------  -----------  ------------------------------------  ------------------------------------  -------  -----------
TAFE-Production     AzureCloud   97b1006a-ca86-4303-b278-42a18379c23c  19537222-55d7-4581-84fb-c2da6e835c74  Enabled  False
Azure for Students  AzureCloud   ef7bf398-50f0-4ac0-a233-43eb9543031c  05440bcf-177c-419d-9948-8297f5966ab4  Enabled  True
@ranipriyanka-cloud ➜ /workspaces/priyanka-cloud-wil/Week4/Lab4f (main) $ az account set --subscription ef7bf398-50f0-4ac0-a233-43eb9543031c
@ranipriyanka-cloud ➜ /workspaces/priyanka-cloud-wil/Week4/Lab4f (main) $ az account show
{
  "environmentName": "AzureCloud",
  "homeTenantId": "05440bcf-177c-419d-9948-8297f5966ab4",
  "id": "ef7bf398-50f0-4ac0-a233-43eb9543031c",
  "isDefault": true,
  "managedByTenants": [],
  "name": "Azure for Students",
  "state": "Enabled",
  "tenantDefaultDomain": "crtc.mq.edu.au",
  "tenantDisplayName": "Macquarie University ",
  "tenantId": "05440bcf-177c-419d-9948-8297f5966ab4",
  "user": {
    "name": "Cloud250310@crtc.mq.edu.au",
    "type": "user"
  }
}
@ranipriyanka-cloud ➜ /workspaces/priyanka-cloud-wil/Week4/Lab4f (main) $ az storage account create \
  --name $STORAGE_NAME \
  --resource-group lab4-rg \
  --location australiaeast \
  --sku Standard_LRS \
  --kind StorageV2 \
  --enable-hierarchical-namespace false
(SubscriptionNotFound) Subscription ef7bf398-50f0-4ac0-a233-43eb9543031c was not found.
Code: SubscriptionNotFound
Message: Subscription ef7bf398-50f0-4ac0-a233-43eb9543031c was not found.
@ranipriyanka-cloud ➜ /workspaces/priyanka-cloud-wil/Week4/Lab4f (main) $ az account list --output table
Name                CloudName    SubscriptionId                        TenantId                              State    IsDefault
------------------  -----------  ------------------------------------  ------------------------------------  -------  -----------
TAFE-Production     AzureCloud   97b1006a-ca86-4303-b278-42a18379c23c  19537222-55d7-4581-84fb-c2da6e835c74  Enabled  False
Azure for Students  AzureCloud   ef7bf398-50f0-4ac0-a233-43eb9543031c  05440bcf-177c-419d-9948-8297f5966ab4  Enabled  True
@ranipriyanka-cloud ➜ /workspaces/priyanka-cloud-wil/Week4/Lab4f (main) $ az account set --subscription <subscription-id>
bash: syntax error near unexpected token `newline'
@ranipriyanka-cloud ➜ /workspaces/priyanka-cloud-wil/Week4/Lab4f (main) $ az account set --subscription ef7bf398-50f0-4ac0-a233-43eb9543031c
@ranipriyanka-cloud ➜ /workspaces/priyanka-cloud-wil/Week4/Lab4f (main) $ az account show
{
  "environmentName": "AzureCloud",
  "homeTenantId": "05440bcf-177c-419d-9948-8297f5966ab4",
  "id": "ef7bf398-50f0-4ac0-a233-43eb9543031c",
  "isDefault": true,
  "managedByTenants": [],
  "name": "Azure for Students",
  "state": "Enabled",
  "tenantDefaultDomain": "crtc.mq.edu.au",
  "tenantDisplayName": "Macquarie University ",
  "tenantId": "05440bcf-177c-419d-9948-8297f5966ab4",
  "user": {
    "name": "Cloud250310@crtc.mq.edu.au",
    "type": "user"
  }
}
@ranipriyanka-cloud ➜ /workspaces/priyanka-cloud-wil/Week4/Lab4f (main) $ STORAGE_NAME=lab4storage$RANDOM
@ranipriyanka-cloud ➜ /workspaces/priyanka-cloud-wil/Week4/Lab4f (main) $ az storage account create \
  --name $STORAGE_NAME \
  --resource-group lab4-rg \
  --location australiaeast \
  --sku Standard_LRS \
  --kind StorageV2 \
  --enable-hierarchical-namespace false
(SubscriptionNotFound) Subscription ef7bf398-50f0-4ac0-a233-43eb9543031c was not found.
Code: SubscriptionNotFound
Message: Subscription ef7bf398-50f0-4ac0-a233-43eb9543031c was not found.
@ranipriyanka-cloud ➜ /workspaces/priyanka-cloud-wil/Week4/Lab4f (main) $ az account list --output table
Name                CloudName    SubscriptionId                        TenantId                              State    IsDefault
------------------  -----------  ------------------------------------  ------------------------------------  -------  -----------
TAFE-Production     AzureCloud   97b1006a-ca86-4303-b278-42a18379c23c  19537222-55d7-4581-84fb-c2da6e835c74  Enabled  False
Azure for Students  AzureCloud   ef7bf398-50f0-4ac0-a233-43eb9543031c  05440bcf-177c-419d-9948-8297f5966ab4  Enabled  True
@ranipriyanka-cloud ➜ /workspaces/priyanka-cloud-wil/Week4/Lab4f (main) $ az account set --subscription ef7bf398-50f0-4ac0-a233-43eb9543031c
@ranipriyanka-cloud ➜ /workspaces/priyanka-cloud-wil/Week4/Lab4f (main) $ az account show
{
  "environmentName": "AzureCloud",
  "homeTenantId": "05440bcf-177c-419d-9948-8297f5966ab4",
  "id": "ef7bf398-50f0-4ac0-a233-43eb9543031c",
  "isDefault": true,
  "managedByTenants": [],
  "name": "Azure for Students",
  "state": "Enabled",
  "tenantDefaultDomain": "crtc.mq.edu.au",
  "tenantDisplayName": "Macquarie University ",
  "tenantId": "05440bcf-177c-419d-9948-8297f5966ab4",
  "user": {
    "name": "Cloud250310@crtc.mq.edu.au",
    "type": "user"
  }
}
@ranipriyanka-cloud ➜ /workspaces/priyanka-cloud-wil/Week4/Lab4f (main) $ az storage account create   --name $STORAGE_NAME   --resource-group lab4-rg   --location australiaeast   --sku Standard_LRS   --kind StorageV2   --enable-hierarchical-namespace false
(SubscriptionNotFound) Subscription ef7bf398-50f0-4ac0-a233-43eb9543031c was not found.
Code: SubscriptionNotFound
Message: Subscription ef7bf398-50f0-4ac0-a233-43eb9543031c was not found.
@ranipriyanka-cloud ➜ /workspaces/priyanka-cloud-wil/Week4/Lab4f (main) $ az group list --output table
Name              Location       Status
----------------  -------------  ---------
NetworkWatcherRG  australiaeast  Succeeded
lab4-rg           australiaeast  Succeeded
@ranipriyanka-cloud ➜ /workspaces/priyanka-cloud-wil/Week4/Lab4f (main) $ az account show
{
  "environmentName": "AzureCloud",
  "homeTenantId": "05440bcf-177c-419d-9948-8297f5966ab4",
  "id": "ef7bf398-50f0-4ac0-a233-43eb9543031c",
  "isDefault": true,
  "managedByTenants": [],
  "name": "Azure for Students",
  "state": "Enabled",
  "tenantDefaultDomain": "crtc.mq.edu.au",
  "tenantDisplayName": "Macquarie University ",
  "tenantId": "05440bcf-177c-419d-9948-8297f5966ab4",
  "user": {
    "name": "Cloud250310@crtc.mq.edu.au",
    "type": "user"
  }
}
@ranipriyanka-cloud ➜ /workspaces/priyanka-cloud-wil/Week4/Lab4f (main) $ az logout
az login
To sign in, use a web browser to open the page https://microsoft.com/devicelogin and enter the code QXJ86QYQY to authenticate.

Retrieving tenants and subscriptions for the selection...

[Tenant and subscription selection]

No     Subscription name    Subscription ID                       Tenant
-----  -------------------  ------------------------------------  ---------------------
[1] *  Azure for Students   ef7bf398-50f0-4ac0-a233-43eb9543031c  Macquarie University 

The default is marked with an *; the default tenant is 'Macquarie University ' and subscription is 'Azure for Students' (ef7bf398-50f0-4ac0-a233-43eb9543031c).

Select a subscription and tenant (Type a number or Enter for no changes): 1

Tenant: Macquarie University 
Subscription: Azure for Students (ef7bf398-50f0-4ac0-a233-43eb9543031c)

[Announcements]
With the new Azure CLI login experience, you can select the subscription you want to use more easily. Learn more about it and its configuration at https://go.microsoft.com/fwlink/?linkid=2271236

If you encounter any problem, please open an issue at https://aka.ms/azclibug

[Warning] The login output has been updated. Please be aware that it no longer displays the full list of available subscriptions by default.

@ranipriyanka-cloud ➜ /workspaces/priyanka-cloud-wil/Week4/Lab4f (main) $ az storage account create   --name $STORAGE_NAME   --resource-group lab4-rg   --location australiaeast   --sku Standard_LRS   --kind StorageV2   --enable-hierarchical-namespace false
(SubscriptionNotFound) Subscription ef7bf398-50f0-4ac0-a233-43eb9543031c was not found.
Code: SubscriptionNotFound
Message: Subscription ef7bf398-50f0-4ac0-a233-43eb9543031c was not found.
@ranipriyanka-cloud ➜ /workspaces/priyanka-cloud-wil/Week4/Lab4f (main) $ az network watcher flow-log configure \
  --resource-group lab4-rg \
  --nsg-name web-nsg \
  --enabled true \
  --storage-account priyankalabstorage \
  --retention 7 \
  --traffic-analytics false
'configure' is misspelled or not recognized by the system.

Examples from AI knowledge base:
https://aka.ms/cli_ref
Read more about the command in reference docs
@ranipriyanka-cloud ➜ /workspaces/priyanka-cloud-wil/Week4/Lab4f (main) $ az network watcher flow-log update \
  --resource-group lab4-rg \
  --nsg-name web-nsg \
  --enabled true \
  --storage-account priyankalabstorage \
  --retention 7 \
  --traffic-analytics false
the following arguments are required: -n/--name, --location/-l

Examples from AI knowledge base:
az network watcher flow-log update --location westus --resource-group MyResourceGroup --name MyFlowLog --storage-account accountname
Update storage account with name to let resource group identify the storage account and network watcher

az network watcher flow-log update --location westus --resource-group MyResourceGroup --name MyFlowLog --storage-account accountid
Update storage account with ID to let location identify the network watcher

az network watcher flow-log update --location westus --resource-group MyAnotherResourceGroup --name MyFlowLog --nsg MyNSG
Update Network Security Group on another resource group

https://aka.ms/cli_ref
Read more about the command in reference docs
@ranipriyanka-cloud ➜ /workspaces/priyanka-cloud-wil/Week4/Lab4f (main) $ az network watcher flow-log update \
  --resource-group lab4-rg \
  --location australiaeast \
  --nsg-name web-nsg \
  --name web-nsg-flowlog \
  --enabled true \
  --storage-account priyankalabstorage \
  --retention 7 \
  --traffic-analytics false
unrecognized arguments: --nsg-name web-nsg

Examples from AI knowledge base:
az network watcher flow-log update --location westus --resource-group MyResourceGroup --name MyFlowLog --storage-account accountid
Update storage account with ID to let location identify the network watcher

az network watcher flow-log update --location westus --resource-group MyAnotherResourceGroup --name MyFlowLog --nsg MyNSG
Update Network Security Group on another resource group

https://docs.microsoft.com/en-US/cli/azure/network/watcher/flow-log#az_network_watcher_flow_log_update
Read more about the command in reference docs