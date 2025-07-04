@ranipriyanka-cloud ➜ /workspaces/priyanka-cloud-wil/Week4/Lab4e (main) $ az network vnet subnet create \
  --resource-group lab4-rg \
  --vnet-name lab4-vnet \
  --name AzureFirewallSubnet \
  --address-prefixes 10.1.3.0/26
{
  "addressPrefix": "10.1.3.0/26",
  "delegations": [],
  "etag": "W/\"393a1d7b-9152-4a4d-9e73-0c118592af1a\"",
  "id": "/subscriptions/ef7bf398-50f0-4ac0-a233-43eb9543031c/resourceGroups/lab4-rg/providers/Microsoft.Network/virtualNetworks/lab4-vnet/subnets/AzureFirewallSubnet",
  "name": "AzureFirewallSubnet",
  "privateEndpointNetworkPolicies": "Disabled",
  "privateLinkServiceNetworkPolicies": "Enabled",
  "provisioningState": "Succeeded",
  "resourceGroup": "lab4-rg",
  "type": "Microsoft.Network/virtualNetworks/subnets"
}
@ranipriyanka-cloud ➜ /workspaces/priyanka-cloud-wil/Week4/Lab4e (main) $ az network public-ip create \
  --resource-group lab4-rg \
  --name lab4-fw-pip \
  --sku Standard \
  --location australiaeast
[Coming breaking change] In the coming release, the default behavior will be changed as follows when sku is Standard and zone is not provided: For zonal regions, you will get a zone-redundant IP indicated by zones:["1","2","3"]; For non-zonal regions, you will get a non zone-redundant IP indicated by zones:null.
{
  "publicIp": {
    "ddosSettings": {
      "protectionMode": "VirtualNetworkInherited"
    },
    "etag": "W/\"c31ebff0-e849-4874-a869-02a79ae81307\"",
    "id": "/subscriptions/ef7bf398-50f0-4ac0-a233-43eb9543031c/resourceGroups/lab4-rg/providers/Microsoft.Network/publicIPAddresses/lab4-fw-pip",
    "idleTimeoutInMinutes": 4,
    "ipAddress": "68.218.73.36",
    "ipTags": [],
    "location": "australiaeast",
    "name": "lab4-fw-pip",
    "provisioningState": "Succeeded",
    "publicIPAddressVersion": "IPv4",
    "publicIPAllocationMethod": "Static",
    "resourceGroup": "lab4-rg",
    "resourceGuid": "c6201a93-d73c-42ab-830d-cee117fb74d1",
    "sku": {
      "name": "Standard",
      "tier": "Regional"
    },
    "type": "Microsoft.Network/publicIPAddresses"
  }
}
@ranipriyanka-cloud ➜ /workspaces/priyanka-cloud-wil/Week4/Lab4e (main) $ az network firewall create \
  --name lab4-fw \
  --resource-group lab4-rg \
  --location australiaeast
Preview version of extension is disabled by default for extension installation, enabled for modules without stable versions. 
Please run 'az config set extension.dynamic_install_allow_preview=true or false' to config it specifically. 
The command requires the extension azure-firewall. Do you want to install it now? The command will continue to run after the extension is installed. (Y/n): y
Run 'az config set extension.use_dynamic_install=yes_without_prompt' to allow installing extensions without prompt.
/home/codespace/.azure/cliextensions/azure-firewall/azext_firewall/vendored_sdks/__init__.py:6: UserWarning: pkg_resources is deprecated as an API. See https://setuptools.pypa.io/en/latest/pkg_resources.html. The pkg_resources package is slated for removal as early as 2025-11-30. Refrain from using this package or pin to Setuptools<81.
  __import__('pkg_resources').declare_namespace(__name__)
{
  "additionalProperties": {},
  "applicationRuleCollections": [],
  "etag": "W/\"a97c3e0d-23e1-433a-8ce7-5febb26b87ec\"",
  "id": "/subscriptions/ef7bf398-50f0-4ac0-a233-43eb9543031c/resourceGroups/lab4-rg/providers/Microsoft.Network/azureFirewalls/lab4-fw",
  "ipConfigurations": [],
  "location": "australiaeast",
  "name": "lab4-fw",
  "natRuleCollections": [],
  "networkRuleCollections": [],
  "provisioningState": "Succeeded",
  "resourceGroup": "lab4-rg",
  "sku": {
    "name": "AZFW_VNet",
    "tier": "Standard"
  },
  "threatIntelMode": "Alert",
  "type": "Microsoft.Network/azureFirewalls"
}
@ranipriyanka-cloud ➜ /workspaces/priyanka-cloud-wil/Week4/Lab4e (main) $ az network firewall ip-config create \
  --firewall-name lab4-fw \
  --resource-group lab4-rg \
  --name lab4-fw-config \
  --public-ip-address lab4-fw-pip \
  --vnet-name lab4-vnet
/home/codespace/.azure/cliextensions/azure-firewall/azext_firewall/vendored_sdks/__init__.py:6: UserWarning: pkg_resources is deprecated as an API. See https://setuptools.pypa.io/en/latest/pkg_resources.html. The pkg_resources package is slated for removal as early as 2025-11-30. Refrain from using this package or pin to Setuptools<81.
  __import__('pkg_resources').declare_namespace(__name__)

^C@ranipriyanka-cloud ➜ /workspaces/priyanka-cloud-wil/Week4/Lab4e (main) $ az network firewall ip-config create   --firewall-name lab4-fw   --resource-group lab4-rg   --name lab4-fw-config   --public-ip-address lab4-fw-pip   --vnet-name lab4-vnet
/home/codespace/.azure/cliextensions/azure-firewall/azext_firewall/vendored_sdks/__init__.py:6: UserWarning: pkg_resources is deprecated as an API. See https://setuptools.pypa.io/en/latest/pkg_resources.html. The pkg_resources package is slated for removal as early as 2025-11-30. Refrain from using this package or pin to Setuptools<81.
  __import__('pkg_resources').declare_namespace(__name__)
{
  "etag": "W/\"0d84258b-804d-4f86-99ca-66b4dcac99a2\"",
  "id": "/subscriptions/ef7bf398-50f0-4ac0-a233-43eb9543031c/resourceGroups/lab4-rg/providers/Microsoft.Network/azureFirewalls/lab4-fw/azureFirewallIpConfigurations/lab4-fw-config",
  "name": "lab4-fw-config",
  "privateIpAddress": "10.1.3.4",
  "provisioningState": "Succeeded",
  "publicIpAddress": {
    "id": "/subscriptions/ef7bf398-50f0-4ac0-a233-43eb9543031c/resourceGroups/lab4-rg/providers/Microsoft.Network/publicIPAddresses/lab4-fw-pip",
    "resourceGroup": "lab4-rg"
  },
  "resourceGroup": "lab4-rg",
  "subnet": {
    "id": "/subscriptions/ef7bf398-50f0-4ac0-a233-43eb9543031c/resourceGroups/lab4-rg/providers/Microsoft.Network/virtualNetworks/lab4-vnet/subnets/AzureFirewallSubnet",
    "resourceGroup": "lab4-rg"
  },
  "type": "Microsoft.Network/azureFirewalls/azureFirewallIpConfigurations"
}
@ranipriyanka-cloud ➜ /workspaces/priyanka-cloud-wil/Week4/Lab4e (main) $ az network firewall network-rule collection add \
  --firewall-name lab4-fw \
  --resource-group lab4-rg \
  --collection-name AllowWebOut \
  --priority 100 \
  --action Allow \
  --rule-name AllowHTTP \
  --protocols TCP \
  --source-addresses '*' \
  --destination-addresses '*' \
  --destination-ports 80
'add' is misspelled or not recognized by the system.

Examples from AI knowledge base:
https://aka.ms/cli_ref
Read more about the command in reference docs
@ranipriyanka-cloud ➜ /workspaces/priyanka-cloud-wil/Week4/Lab4e (main) $ az network firewall network-rule add \
  --firewall-name lab4-fw \
  --resource-group lab4-rg \
  --collection-name AllowWebOut \
  --priority 100 \
  --action Allow \
  --name AllowHTTP \
  --protocols TCP \
  --source-addresses '*' \
  --destination-addresses '*' \
  --destination-ports 80
'add' is misspelled or not recognized by the system.

Examples from AI knowledge base:
https://aka.ms/cli_ref
Read more about the command in reference docs
@ranipriyanka-cloud ➜ /workspaces/priyanka-cloud-wil/Week4/Lab4e (main) $ az network firewall network-rule create \
  --firewall-name lab4-fw \
  --resource-group lab4-rg \
  --collection-name AllowWebOut \
  --priority 100 \
  --action Allow \
  --name AllowHTTP \
  --protocols TCP \
  --source-addresses '*' \
  --destination-addresses '*' \
  --destination-ports 80
/home/codespace/.azure/cliextensions/azure-firewall/azext_firewall/vendored_sdks/__init__.py:6: UserWarning: pkg_resources is deprecated as an API. See https://setuptools.pypa.io/en/latest/pkg_resources.html. The pkg_resources package is slated for removal as early as 2025-11-30. Refrain from using this package or pin to Setuptools<81.
  __import__('pkg_resources').declare_namespace(__name__)
Creating rule collection 'AllowWebOut'.
{
  "description": null,
  "destinationAddresses": [
    "*"
  ],
  "destinationFqdns": [],
  "destinationIpGroups": [],
  "destinationPorts": [
    "80"
  ],
  "name": "AllowHTTP",
  "protocols": [
    "TCP"
  ],
  "sourceAddresses": [
    "*"
  ],
  "sourceIpGroups": []
}
@ranipriyanka-cloud ➜ /workspaces/priyanka-cloud-wil/Week4/Lab4e (main) $ az network vnet subnet create \
  --resource-group lab4-rg \
  --vnet-name lab4-vnet \
  --name test-subnet \
  --address-prefixes 10.1.1.0/24
(NetcfgSubnetRangesOverlap) Subnet 'test-subnet' is not valid because its IP address range overlaps with that of an existing subnet in virtual network 'lab4-vnet'.
Code: NetcfgSubnetRangesOverlap
Message: Subnet 'test-subnet' is not valid because its IP address range overlaps with that of an existing subnet in virtual network 'lab4-vnet'.
@ranipriyanka-cloud ➜ /workspaces/priyanka-cloud-wil/Week4/Lab4e (main) $ az network vnet subnet list \
  --resource-group lab4-rg \
  --vnet-name lab4-vnet \
  --output table
Name                 PrivateEndpointNetworkPolicies    PrivateLinkServiceNetworkPolicies    ProvisioningState    ResourceGroup    AddressPrefix
-------------------  --------------------------------  -----------------------------------  -------------------  ---------------  ---------------
db-subnet            Disabled                          Enabled                              Succeeded            lab4-rg
web-subnet           Disabled                          Enabled                              Succeeded            lab4-rg
AzureFirewallSubnet  Disabled                          Enabled                              Succeeded            lab4-rg          10.1.3.0/26
@ranipriyanka-cloud ➜ /workspaces/priyanka-cloud-wil/Week4/Lab4e (main) $ az network vnet subnet create \
  --resource-group lab4-rg \
  --vnet-name lab4-vnet \
  --name test-subnet \
  --address-prefixes 10.1.2.0/24
(NetcfgSubnetRangesOverlap) Subnet 'test-subnet' is not valid because its IP address range overlaps with that of an existing subnet in virtual network 'lab4-vnet'.
Code: NetcfgSubnetRangesOverlap
Message: Subnet 'test-subnet' is not valid because its IP address range overlaps with that of an existing subnet in virtual network 'lab4-vnet'.
@ranipriyanka-cloud ➜ /workspaces/priyanka-cloud-wil/Week4/Lab4e (main) $ az network vnet subnet list \
  --resource-group lab4-rg \
  --vnet-name lab4-vnet \
  --output table
Name                 PrivateEndpointNetworkPolicies    PrivateLinkServiceNetworkPolicies    ProvisioningState    ResourceGroup    AddressPrefix
-------------------  --------------------------------  -----------------------------------  -------------------  ---------------  ---------------
db-subnet            Disabled                          Enabled                              Succeeded            lab4-rg
web-subnet           Disabled                          Enabled                              Succeeded            lab4-rg
AzureFirewallSubnet  Disabled                          Enabled                              Succeeded            lab4-rg          10.1.3.0/26
@ranipriyanka-cloud ➜ /workspaces/priyanka-cloud-wil/Week4/Lab4e (main) $ az network vnet subnet create \
  --resource-group lab4-rg \
  --vnet-name lab4-vnet \
  --name test-subnet \
  --address-prefixes 10.1.3.0/24
(NetcfgSubnetRangesOverlap) Subnet 'test-subnet' is not valid because its IP address range overlaps with that of an existing subnet in virtual network 'lab4-vnet'.
Code: NetcfgSubnetRangesOverlap
Message: Subnet 'test-subnet' is not valid because its IP address range overlaps with that of an existing subnet in virtual network 'lab4-vnet'.
@ranipriyanka-cloud ➜ /workspaces/priyanka-cloud-wil/Week4/Lab4e (main) $ az network vnet subnet create \
  --resource-group lab4-rg \
  --vnet-name lab4-vnet \
  --name test-subnet \
  --address-prefixes 10.1.4.0/24
{
  "addressPrefix": "10.1.4.0/24",
  "delegations": [],
  "etag": "W/\"24786ca0-a6ed-4234-bb17-d7b56f865be3\"",
  "id": "/subscriptions/ef7bf398-50f0-4ac0-a233-43eb9543031c/resourceGroups/lab4-rg/providers/Microsoft.Network/virtualNetworks/lab4-vnet/subnets/test-subnet",
  "name": "test-subnet",
  "privateEndpointNetworkPolicies": "Disabled",
  "privateLinkServiceNetworkPolicies": "Enabled",
  "provisioningState": "Succeeded",
  "resourceGroup": "lab4-rg",
  "type": "Microsoft.Network/virtualNetworks/subnets"
}
@ranipriyanka-cloud ➜ /workspaces/priyanka-cloud-wil/Week4/Lab4e (main) $ ^C
@ranipriyanka-cloud ➜ /workspaces/priyanka-cloud-wil/Week4/Lab4e (main) $ AMIN_PASSWORD=P@ssword@$RANDOM

az vm create \
  --resource-group lab2c-rg \
  --name lab2c-ubuntu-vm \
  --image Ubuntu2204 \
  --size Standard_B1s \
  --admin-username azureuser \
  --admin-password "$ADMIN_PASSWORD" \
  --authentication-type password \
  --output json
The default value of '--size' will be changed to 'Standard_D2s_v5' from 'Standard_DS1_v2' in a future release.
(ResourceGroupNotFound) Resource group 'lab2c-rg' could not be found.
Code: ResourceGroupNotFound
Message: Resource group 'lab2c-rg' could not be found.
@ranipriyanka-cloud ➜ /workspaces/priyanka-cloud-wil/Week4/Lab4e (main) $ AdMIN_PASSWORD=P@ssword@$RANDOM
@ranipriyanka-cloud ➜ /workspaces/priyanka-cloud-wil/Week4/Lab4e (main) $ az vm create \
  --resource-group lab4-rg \
  --name lab4-ubuntu-vm \
  --image Ubuntu2204 \
  --size Standard_B1s \
  --admin-username azureuser \
  --admin-password "$ADMIN_PASSWORD" \
  --authentication-type password \
  --output json
The default value of '--size' will be changed to 'Standard_D2s_v5' from 'Standard_DS1_v2' in a future release.
Admin Password: 
Confirm Admin Password: 
{
  "fqdns": "",
  "id": "/subscriptions/ef7bf398-50f0-4ac0-a233-43eb9543031c/resourceGroups/lab4-rg/providers/Microsoft.Compute/virtualMachines/lab4-ubuntu-vm",
  "location": "australiaeast",
  "macAddress": "00-22-48-94-77-BE",
  "powerState": "VM running",
  "privateIpAddress": "10.1.2.4",
  "publicIpAddress": "68.218.66.223",
  "resourceGroup": "lab4-rg",
  "zones": ""
}
@ranipriyanka-cloud ➜ /workspaces/priyanka-cloud-wil/Week4/Lab4e (main) $ az network firewall show \
  --name lab4-fw \
  --resource-group lab4-rg \
  --query "ipConfigurations[0].privateIPAddress" \
  --output tsv
/home/codespace/.azure/cliextensions/azure-firewall/azext_firewall/vendored_sdks/__init__.py:6: UserWarning: pkg_resources is deprecated as an API. See https://setuptools.pypa.io/en/latest/pkg_resources.html. The pkg_resources package is slated for removal as early as 2025-11-30. Refrain from using this package or pin to Setuptools<81.
  __import__('pkg_resources').declare_namespace(__name__)
10.1.3.4
@ranipriyanka-cloud ➜ /workspaces/priyanka-cloud-wil/Week4/Lab4e (main) $ az network route-table create \
  --name lab4-fw-rt \
  --resource-group lab4-rg \
  --location australiaeast
{
  "disableBgpRoutePropagation": false,
  "etag": "W/\"cb46e67a-f6b0-4719-a165-db9eff9cbb77\"",
  "id": "/subscriptions/ef7bf398-50f0-4ac0-a233-43eb9543031c/resourceGroups/lab4-rg/providers/Microsoft.Network/routeTables/lab4-fw-rt",
  "location": "australiaeast",
  "name": "lab4-fw-rt",
  "provisioningState": "Succeeded",
  "resourceGroup": "lab4-rg",
  "resourceGuid": "4eae4615-1ce9-46fd-87ef-47c141f66af0",
  "routes": [],
  "type": "Microsoft.Network/routeTables"
}
@ranipriyanka-cloud ➜ /workspaces/priyanka-cloud-wil/Week4/Lab4e (main) $ az network route-table route create \
  --resource-group lab4-rg \
  --route-table-name lab4-fw-rt \
  --name DefaultRoute \
  --address-prefix 0.0.0.0/0 \
  --next-hop-type VirtualAppliance \
  --next-hop-ip-address 10.1.3.4
{
  "addressPrefix": "0.0.0.0/0",
  "etag": "W/\"f3bef2e9-0813-499c-b27f-84625a6703a5\"",
  "hasBgpOverride": false,
  "id": "/subscriptions/ef7bf398-50f0-4ac0-a233-43eb9543031c/resourceGroups/lab4-rg/providers/Microsoft.Network/routeTables/lab4-fw-rt/routes/DefaultRoute",
  "name": "DefaultRoute",
  "nextHopIpAddress": "10.1.3.4",
  "nextHopType": "VirtualAppliance",
  "provisioningState": "Succeeded",
  "resourceGroup": "lab4-rg",
  "type": "Microsoft.Network/routeTables/routes"
}
@ranipriyanka-cloud ➜ /workspaces/priyanka-cloud-wil/Week4/Lab4e (main) $ az network vnet subnet update \
  --vnet-name lab4-vnet \
  --name test-subnet \
  --resource-group lab4-rg \
  --route-table lab4-fw-rt
{
  "addressPrefix": "10.1.4.0/24",
  "delegations": [],
  "etag": "W/\"9254dda5-ace2-4640-870f-7731ceec709d\"",
  "id": "/subscriptions/ef7bf398-50f0-4ac0-a233-43eb9543031c/resourceGroups/lab4-rg/providers/Microsoft.Network/virtualNetworks/lab4-vnet/subnets/test-subnet",
  "name": "test-subnet",
  "privateEndpointNetworkPolicies": "Disabled",
  "privateLinkServiceNetworkPolicies": "Enabled",
  "provisioningState": "Succeeded",
  "resourceGroup": "lab4-rg",
  "routeTable": {
    "id": "/subscriptions/ef7bf398-50f0-4ac0-a233-43eb9543031c/resourceGroups/lab4-rg/providers/Microsoft.Network/routeTables/lab4-fw-rt",
    "resourceGroup": "lab4-rg"
  },
  "type": "Microsoft.Network/virtualNetworks/subnets"
}
@ranipriyanka-cloud ➜ /workspaces/priyanka-cloud-wil/Week4/Lab4e (main) $ az vm ssh -g lab4-rg -n testvm
'ssh' is misspelled or not recognized by the system.

Examples from AI knowledge base:
https://aka.ms/cli_ref
Read more about the command in reference docs
@ranipriyanka-cloud ➜ /workspaces/priyanka-cloud-wil/Week4/Lab4e (main) $ az extension add --name ssh
@ranipriyanka-cloud ➜ /workspaces/priyanka-cloud-wil/Week4/Lab4e (main) $ 
@ranipriyanka-cloud ➜ /workspaces/priyanka-cloud-wil/Week4/Lab4e (main) $ az upgrade
This command is in preview and under development. Reference and support levels: https://aka.ms/CLI_refstatus
Your current Azure CLI version is 2.74.0. Latest version available is 2.75.0.
Please check the release notes first: https://learn.microsoft.com/cli/azure/release-notes-azure-cli
Do you want to continue? (Y/n): y
Hit:1 https://dl.yarnpkg.com/debian stable InRelease
Get:2 https://packages.microsoft.com/repos/azure-cli noble InRelease [3564 B]                
Get:3 https://packages.microsoft.com/repos/microsoft-ubuntu-noble-prod noble InRelease [3600 B]                                                      
Hit:4 https://repo.anaconda.com/pkgs/misc/debrepo/conda stable InRelease                                                                                        
Get:5 https://packages.microsoft.com/repos/azure-cli noble/main amd64 Packages [1437 B]                                        
Get:6 https://packages.microsoft.com/repos/microsoft-ubuntu-noble-prod noble/main amd64 Packages [38.4 kB]                      
Get:7 http://security.ubuntu.com/ubuntu noble-security InRelease [126 kB]                                                            
Hit:8 http://archive.ubuntu.com/ubuntu noble InRelease   
Get:9 http://archive.ubuntu.com/ubuntu noble-updates InRelease [126 kB]
Get:10 http://security.ubuntu.com/ubuntu noble-security/universe amd64 Packages [1122 kB]
Get:11 http://archive.ubuntu.com/ubuntu noble-backports InRelease [126 kB]
Get:12 http://archive.ubuntu.com/ubuntu noble-updates/restricted amd64 Packages [1766 kB]
Get:13 http://security.ubuntu.com/ubuntu noble-security/main amd64 Packages [1221 kB]
Get:14 http://security.ubuntu.com/ubuntu noble-security/multiverse amd64 Packages [23.0 kB]
Get:15 http://security.ubuntu.com/ubuntu noble-security/restricted amd64 Packages [1708 kB]   
Get:16 http://archive.ubuntu.com/ubuntu noble-updates/universe amd64 Packages [1432 kB]      
Get:17 http://archive.ubuntu.com/ubuntu noble-updates/multiverse amd64 Packages [28.1 kB]
Get:18 http://archive.ubuntu.com/ubuntu noble-updates/main amd64 Packages [1547 kB]
Fetched 9273 kB in 4s (2352 kB/s)                           
Reading package lists... Done
Reading package lists... Done
Building dependency tree... Done
Reading state information... Done
The following packages will be upgraded:
  azure-cli
1 upgraded, 0 newly installed, 0 to remove and 30 not upgraded.
Need to get 53.9 MB of archives.
After this operation, 480 kB of additional disk space will be used.
Get:1 https://packages.microsoft.com/repos/azure-cli noble/main amd64 azure-cli amd64 2.75.0-1~noble [53.9 MB]
Fetched 53.9 MB in 2s (25.2 MB/s)     
(Reading database ... 90150 files and directories currently installed.)
Preparing to unpack .../azure-cli_2.75.0-1~noble_amd64.deb ...
Unpacking azure-cli (2.75.0-1~noble) over (2.74.0-1~noble) ...
Setting up azure-cli (2.75.0-1~noble) ...
Upgrading extensions
Checking update for azure-firewall
Latest version of 'azure-firewall' is already installed.

Use --debug for more information
Checking update for ssh
Latest version of 'ssh' is already installed.

Use --debug for more information
Upgrade finished.
@ranipriyanka-cloud ➜ /workspaces/priyanka-cloud-wil/Week4/Lab4e (main) $ az vm ssh -g lab4-rg -n testvm
'ssh' is misspelled or not recognized by the system.

Examples from AI knowledge base:
https://aka.ms/cli_ref
Read more about the command in reference docs
@ranipriyanka-cloud ➜ /workspaces/priyanka-cloud-wil/Week4/Lab4e (main) $ ssh azureuser@68.218.73.36

az vm ssh -g lab4-rg -n testvm
^Z
[1]+  Stopped                 ssh azureuser@68.218.73.36
@ranipriyanka-cloud ➜ /workspaces/priyanka-cloud-wil/Week4/Lab4e (main) $ ssh azureuser@68.218.73.36
^C
@ranipriyanka-cloud ➜ /workspaces/priyanka-cloud-wil/Week4/Lab4e (main) $ az extension add --name ssh
Extension 'ssh' 2.0.6 is already installed.
@ranipriyanka-cloud ➜ /workspaces/priyanka-cloud-wil/Week4/Lab4e (main) $ az vm ssh -g lab4-rg -n testvm
'ssh' is misspelled or not recognized by the system.

Examples from AI knowledge base:
https://aka.ms/cli_ref
Read more about the command in reference docs
@ranipriyanka-cloud ➜ /workspaces/priyanka-cloud-wil/Week4/Lab4e (main) $ az ssh -g lab4-rg -n testvm
'lab4-rg' is misspelled or not recognized by the system.

Examples from AI knowledge base:
https://aka.ms/cli_ref
Read more about the command in reference docs
@ranipriyanka-cloud ➜ /workspaces/priyanka-cloud-wil/Week4/Lab4e (main) $ az ssh vm -g lab4-rg -n testvm
A valid resource testvm in the resource group lab4-rg was not found. 
Please ensure the active subscription is set properly and resource exists.
@ranipriyanka-cloud ➜ /workspaces/priyanka-cloud-wil/Week4/Lab4e (main) $ az ssh vm -g lab4-rg -n testvm^C
@ranipriyanka-cloud ➜ /workspaces/priyanka-cloud-wil/Week4/Lab4e (main) $ az account show
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
@ranipriyanka-cloud ➜ /workspaces/priyanka-cloud-wil/Week4/Lab4e (main) $ az vm list -g lab4-rg -o table
Name            ResourceGroup    Location
--------------  ---------------  -------------
lab4-ubuntu-vm  lab4-rg          australiaeast
@ranipriyanka-cloud ➜ /workspaces/priyanka-cloud-wil/Week4/Lab4e (main) $ az account set --subscription ef7bf398-50f0-4ac0-a233-43eb9543031c
@ranipriyanka-cloud ➜ /workspaces/priyanka-cloud-wil/Week4/Lab4e (main) $ az vm list -g lab4-rg -o table
Name            ResourceGroup    Location
--------------  ---------------  -------------
lab4-ubuntu-vm  lab4-rg          australiaeast
@ranipriyanka-cloud ➜ /workspaces/priyanka-cloud-wil/Week4/Lab4e (main) $ ^C
@ranipriyanka-cloud ➜ /workspaces/priyanka-cloud-wil/Week4/Lab4e (main) $ az ssh vm -g lab4-rg -n lab4-ubuntu-vm
OpenSSH_9.6p1 Ubuntu-3ubuntu13.11, OpenSSL 3.0.13 30 Jan 2024
The authenticity of host '68.218.66.223 (68.218.66.223)' can't be established.
ED25519 key fingerprint is SHA256:0nw1SjjT8Eo4RZ8Qb9ux62ztxdRVkdDTQ16AovXLNgs.
This key is not known by any other names.
Are you sure you want to continue connecting (yes/no/[fingerprint])? n
Please type 'yes', 'no' or the fingerprint: no
Host key verification failed.
@ranipriyanka-cloud ➜ /workspaces/priyanka-cloud-wil/Week4/Lab4e (main) $ az ssh vm -g lab4-rg -n lab4-ubuntu-vm
OpenSSH_9.6p1 Ubuntu-3ubuntu13.11, OpenSSL 3.0.13 30 Jan 2024
The authenticity of host '68.218.66.223 (68.218.66.223)' can't be established.
ED25519 key fingerprint is SHA256:0nw1SjjT8Eo4RZ8Qb9ux62ztxdRVkdDTQ16AovXLNgs.
This key is not known by any other names.
Are you sure you want to continue connecting (yes/no/[fingerprint])? yes
Warning: Permanently added '68.218.66.223' (ED25519) to the list of known hosts.
cloud250310@crtc.mq.edu.au@68.218.66.223's password: 
cloud250310@crtc.mq.edu.au@68.218.66.223's password: Permission denied, please try again.

@ranipriyanka-cloud ➜ /workspaces/priyanka-cloud-wil/Week4/Lab4e (main) $ az ssh vm -g lab4-rg -n lab4-ubuntu-vm^C
@ranipriyanka-cloud ➜ /workspaces/priyanka-cloud-wil/Week4/Lab4e (main) $ ssh lab4-ubuntu-vm@68.218.66.223
lab4-ubuntu-vm@68.218.66.223's password: 
Permission denied, please try again.
lab4-ubuntu-vm@68.218.66.223's password: 
Permission denied, please try again.
lab4-ubuntu-vm@68.218.66.223's password: 

@ranipriyanka-cloud ➜ /workspaces/priyanka-cloud-wil/Week4/Lab4e (main) $ ssh azureuser@68.218.66.223
azureuser@68.218.66.223's password: 
Welcome to Ubuntu 22.04.5 LTS (GNU/Linux 6.8.0-1030-azure x86_64)

 * Documentation:  https://help.ubuntu.com
 * Management:     https://landscape.canonical.com
 * Support:        https://ubuntu.com/pro

 System information as of Fri Jul  4 03:01:41 UTC 2025

  System load:  0.32              Processes:             106
  Usage of /:   5.3% of 28.89GB   Users logged in:       0
  Memory usage: 30%               IPv4 address for eth0: 10.1.2.4
  Swap usage:   0%

Expanded Security Maintenance for Applications is not enabled.

0 updates can be applied immediately.

Enable ESM Apps to receive additional future security updates.
See https://ubuntu.com/esm or run: sudo pro status


The list of available updates is more than a week old.
To check for new updates run: sudo apt update


The programs included with the Ubuntu system are free software;
the exact distribution terms for each program are described in the
individual files in /usr/share/doc/*/copyright.

Ubuntu comes with ABSOLUTELY NO WARRANTY, to the extent permitted by
applicable law.

To run a command as administrator (user "root"), use "sudo <command>".
See "man sudo_root" for details.

azureuser@lab4-ubuntu-vm:~$ curl -I http://example.com
HTTP/1.1 200 OK
Content-Type: text/html
ETag: "84238dfc8092e5d9c0dac8ef93371a07:1736799080.121134"
Last-Modified: Mon, 13 Jan 2025 20:11:20 GMT
Cache-Control: max-age=1479
Date: Fri, 04 Jul 2025 03:02:09 GMT
Connection: keep-alive

azureuser@lab4-ubuntu-vm:~$ curl -I https://example.com
HTTP/2 200 
content-type: text/html
etag: "84238dfc8092e5d9c0dac8ef93371a07:1736799080.121134"
last-modified: Mon, 13 Jan 2025 20:11:20 GMT
cache-control: max-age=1448
date: Fri, 04 Jul 2025 03:02:25 GMT
alt-svc: h3=":443"; ma=93600,h3-29=":443"; ma=93600




azureuser@lab4-ubuntu-vm:~$ exit
logout
Connection to 68.218.66.223 closed.cd ..
c