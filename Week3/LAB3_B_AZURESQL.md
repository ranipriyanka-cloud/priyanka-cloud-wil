@ranipriyanka-cloud ➜ /workspaces/priyanka-cloud-wil (main) $ cd Week3
@ranipriyanka-cloud ➜ /workspaces/priyanka-cloud-wil/Week3 (main) $ az group create --name sql-demo-rg --location australiaeast
{
  "id": "/subscriptions/ef7bf398-50f0-4ac0-a233-43eb9543031c/resourceGroups/sql-demo-rg",
  "location": "australiaeast",
  "managedBy": null,
  "name": "sql-demo-rg",
  "properties": {
    "provisioningState": "Succeeded"
  },
  "tags": null,
  "type": "Microsoft.Resources/resourceGroups"
}
@ranipriyanka-cloud ➜ /workspaces/priyanka-cloud-wil/Week3 (main) $ az sql server create \
  --name studentsqlserver99 \
  --resource-group sql-demo-rg \
  --location australiaeast \
  --admin-user sqladminpriya \
  --admin-password "$SQL_PASSWORD"
(InvalidParameterValue) Invalid value given for parameter Password. Specify a valid parameter value.
Code: InvalidParameterValue
Message: Invalid value given for parameter Password. Specify a valid parameter value.
@ranipriyanka-cloud ➜ /workspaces/priyanka-cloud-wil/Week3 (
@ranipriyanka-cloud ➜ /workspaces/priyanka-cloud-
@ranipriyanka-cloud ➜ /workspaces/priyanka-cloud-wil/Week3 (main) $ az sql
 server create   --name studentsqlserver99   --resource-group sql-demo-rg   --location australiaeast   --admin-user sqladminpriya   --admin-password "mySqlP@assword99"
{
  "administratorLogin": "sqladminpriya",
  "administratorLoginPassword": null,
  "administrators": null,
  "externalGovernanceStatus": "Disabled",
  "federatedClientId": null,
  "fullyQualifiedDomainName": "studentsqlserver99.database.windows.net",
  "id": "/subscriptions/ef7bf398-50f0-4ac0-a233-43eb9543031c/resourceGroups/sql-demo-rg/providers/Microsoft.Sql/servers/studentsqlserver99",
  "identity": null,
  "isIPv6Enabled": null,
  "keyId": null,
  "kind": "v12.0",
  "location": "australiaeast",
  "minimalTlsVersion": "1.2",
  "name": "studentsqlserver99",
  "primaryUserAssignedIdentityId": null,
  "privateEndpointConnections": [],
  "publicNetworkAccess": "Enabled",
  "resourceGroup": "sql-demo-rg",
  "restrictOutboundNetworkAccess": "Disabled",
  "state": "Ready",
  "tags": null,
  "type": "Microsoft.Sql/servers",
  "version": "12.0",
  "workspaceFeature": null
}
@ranipriyanka-cloud ➜ /workspaces/priyanka-cloud-wil/Week3 (main) $ az sql db create \
  --resource-group sql-demo-rg \
  --server studentsqlserver99 \
  --name studentdb \
  --service-objective Basic
{
  "autoPauseDelay": null,
  "availabilityZone": "NoPreference",
  "catalogCollation": "SQL_Latin1_General_CP1_CI_AS",
  "collation": "SQL_Latin1_General_CP1_CI_AS",
  "createMode": null,
  "creationDate": "2025-06-27T00:53:03.620000+00:00",
  "currentBackupStorageRedundancy": "Geo",
  "currentServiceObjectiveName": "Basic",
  "currentSku": {
    "capacity": 5,
    "family": null,
    "name": "Basic",
    "size": null,
    "tier": "Basic"
  },
  "databaseId": "3d59778b-8a9b-4695-9b73-431a2315163b",
  "defaultSecondaryLocation": "australiasoutheast",
  "earliestRestoreDate": null,
  "edition": "Basic",
  "elasticPoolId": null,
  "elasticPoolName": null,
  "encryptionProtector": null,
  "encryptionProtectorAutoRotation": null,
  "failoverGroupId": null,
  "federatedClientId": null,
  "freeLimitExhaustionBehavior": null,
  "highAvailabilityReplicaCount": null,
  "id": "/subscriptions/ef7bf398-50f0-4ac0-a233-43eb9543031c/resourceGroups/sql-demo-rg/providers/Microsoft.Sql/servers/studentsqlserver99/databases/studentdb",
  "identity": null,
  "isInfraEncryptionEnabled": false,
  "keys": null,
  "kind": "v12.0,user",
  "ledgerOn": false,
  "licenseType": null,
  "location": "australiaeast",
  "longTermRetentionBackupResourceId": null,
  "maintenanceConfigurationId": "/subscriptions/ef7bf398-50f0-4ac0-a233-43eb9543031c/providers/Microsoft.Maintenance/publicMaintenanceConfigurations/SQL_Default",
  "managedBy": null,
  "manualCutover": null,
  "maxLogSizeBytes": null,
  "maxSizeBytes": 2147483648,
  "minCapacity": null,
  "name": "studentdb",
  "pausedDate": null,
  "performCutover": null,
  "preferredEnclaveType": null,
  "readScale": "Disabled",
  "recoverableDatabaseId": null,
  "recoveryServicesRecoveryPointId": null,
  "requestedBackupStorageRedundancy": "Geo",
  "requestedServiceObjectiveName": "Basic",
  "resourceGroup": "sql-demo-rg",
  "restorableDroppedDatabaseId": null,
  "restorePointInTime": null,
  "resumedDate": null,
  "sampleName": null,
  "secondaryType": null,
  "sku": {
    "capacity": 5,
    "family": null,
    "name": "Basic",
    "size": null,
    "tier": "Basic"
  },
  "sourceDatabaseDeletionDate": null,
  "sourceDatabaseId": null,
  "sourceResourceId": null,
  "status": "Online",
  "tags": null,
  "type": "Microsoft.Sql/servers/databases",
  "useFreeLimit": null,
  "zoneRedundant": false
}
@ranipriyanka-cloud ➜ /workspaces/priyanka-cloud-wil/Week3 (main) $ az sql server firewall-rule create \
  --resource-group sql-demo-rg \
  --server studentsqlserver99 \
  --name allow-local-ip \
  --start-ip-address 0.0.0.0 \
  --end-ip-address 255.255.255.255
{
  "endIpAddress": "255.255.255.255",
  "id": "/subscriptions/ef7bf398-50f0-4ac0-a233-43eb9543031c/resourceGroups/sql-demo-rg/providers/Microsoft.Sql/servers/studentsqlserver99/firewallRules/allow-local-ip",
  "name": "allow-local-ip",
  "resourceGroup": "sql-demo-rg",
  "startIpAddress": "0.0.0.0",
  "type": "Microsoft.Sql/servers/firewallRules"
}
@ranipriyanka-cloud ➜ /workspaces/priyanka-cloud-wil/Week3 (
@ranipriyanka-cloud ➜ /workspaces/priyanka-cloud-wil/Week3 (
@ranipriyanka-cloud ➜ /workspaces/priyanka-cloud-wil/Week3 (
@ranipriyanka-cloud ➜ /workspaces/priyanka-cloud-wil/Week3 (
@ranipriyanka-cloud ➜ /workspaces/priyanka-cloud-wil/Week3 (
@ranipriyanka-cloud ➜ /workspaces/priyanka-cloud-wil/Week3 (
@ranipriyanka-cloud ➜ /workspaces/priyanka-cloud-wil/Week3 (
@ranipriyanka-cloud ➜ /workspaces/priyanka-cloud-wil/Week3 (main) $ ^C
@ranipriyanka-cloud ➜ /workspaces/priyanka-cloud-wil/Week3 (main) $ docker run -it --rm mcr.microsoft.com/mssql-tools \
  /opt/mssql-tools/bin/sqlcmd -S studentsqlserver99.database.windows.net -U sqladmin -d studentdb
Unable to find image 'mcr.microsoft.com/mssql-tools:latest' locally
latest: Pulling from mssql-tools
ae79f2514705: Pull complete 
5ad56d5fc149: Pull complete 
170e558760e8: Pull complete 
395460e233f5: Pull complete 
6f01dc62e444: Pull complete 
c8578e10f883: Pull complete 
b536ad59f00c: Pull complete 
993481bbb8d3: Pull complete 
100943e5d9cb: Pull complete 
749f0e510ec7: Pull complete 
920a52e94cef: Pull complete 
7cf0c7ba476e: Pull complete 
2d6e05bfcbd2: Pull complete 
Digest: sha256:62556500522072535cb3df2bb5965333dded9be47000473e9e0f84118e248642
Status: Downloaded newer image for mcr.microsoft.com/mssql-tools:latest
Password: 
Sqlcmd: Error: Microsoft ODBC Driver 13 for SQL Server : Login failed for user 'sqladmin'..
@ranipriyanka-cloud ➜ /workspaces/priyanka-cloud-wil/Week3 (main) $ docker run -it --rm mcr.microsoft.com/mssql-tools \
  /opt/mssql-tools/bin/sqlcmd -S studentsqlserver99.database.windows.net -U sqladmin -d studentdb
Password: 
Sqlcmd: Error: Microsoft ODBC Driver 13 for SQL Server : Login failed for user 'sqladmin'..
@ranipriyanka-cloud ➜ /workspaces/priyanka-cloud-wil/Week3 (main) $ docker run -it --rm mcr.microsoft.com/mssql-tools   
/opt/mssql-tools/bin/sqlcmd -S studentsqlserver99.database.windows.net -U sqladminpriya -d studentdb
Password: 
Sqlcmd: Error: Microsoft ODBC Driver 13 for SQL Server : Login failed for user 'sqladminpriya'..
@ranipriyanka-cloud ➜ /workspaces/priyanka-cloud-wil/Week3 (main) $ docker run -it --rm mcr.microsoft.com/mssql-tools \
  /opt/mssql-tools/bin/sqlcmd -S studentsqlserver99.database.windows.net -U sqladminpriya  -d  studentdb

Password: 
1> SELECT db_name go
2> 
3> 

Sqlcmd: Warning: The last operation was terminated because the user pressed CTRL+C.
@ranipriyanka-cloud ➜ /workspaces/priyanka-cloud-wil/Week3 (main) $ docker run -it --rm mcr.microsoft.com/mssql-tools   /opt/mssql-tools/bin/sqlcmd -S studentsqlserver99.database.windows.net -U sqladminpriya  -d  studentdb
Password: 
Sqlcmd: Error: Microsoft ODBC Driver 13 for SQL Server : Login failed for user 'sqladminpriya'..
@ranipriyanka-cloud ➜ /workspaces/priyanka-cloud-wil/Week3 (main) $ docker run -it --rm mcr.microsoft.com/mssql-tools   /opt/mssql-tools/bin/sqlcmd -S studentsqlserver99.database.windows.net -U sqladminpriya  -d  studentdb
Password: 
1> SELECT db_nAME();
2> GO
                                                                                                                                
--------------------------------------------------------------------------------------------------------------------------------
studentdb                                                                                                                       

(1 rows affected)
1> CREATE TABLE students();
2> id INT PRIMARY KEY,
3> name NVARCHAR(100),
4> enrolled_date DATE
5> );
6> GO
Msg 102, Level 15, State 1, Server studentsqlserver99, Line 1
Incorrect syntax near ')'.
1> CREATE TABLE students(
2> id INT PRIMARY KEY,
3> name NVARCHAR(100),
4> enrolled_date DATE
5> );
6> GO
1> SELECT TABLE_SCHEMA, TABLE_NAME
2> FROM INFORMATION_SCHEMA.TABLES
3> WHERE TABLE_TYPE ='BASE TABLE';
4> GO
TABLE_SCHEMA                                                                                                                     TABLE_NAME                                                                                                                      
-------------------------------------------------------------------------------------------------------------------------------- --------------------------------------------------------------------------------------------------------------------------------
dbo                                                                                                                              students                                                                                                                        

(1 rows affected)
1> INSERT INTO students (id, name, enrolled_date)
2> values (1,'Priyanka Rani', 2025-06-01');
3~ GO
4~ SELECT *FROM students;
5~ GO
6~ 
7~ 

Sqlcmd: Warning: The last operation was terminated because the user pressed CTRL+C.
@ranipriyanka-cloud ➜ /workspaces/priyanka-cloud-wil/Week3 (main) $ docker run -it --rm mcr.microsoft.com/mssql-tools   /opt/mssql-tools/bin/sqlcmd -S studentsqlserver99.database.windows.net -U sqladminpriya  -d  studentdb
Password: 
Sqlcmd: Error: Microsoft ODBC Driver 13 for SQL Server : Login failed for user 'sqladminpriya'..
@ranipriyanka-cloud ➜ /workspaces/priyanka-cloud-wil/Week3 (main) $ docker run -it --rm mcr.microsoft.com/mssql-tools   /opt/mssql-tools/bin/sqlcmd -S studentsqlserver99.database.windows.net -U sqladminpriya  -d  studentdb
Password: 
1> INSERT INTO students (id, name, enrolled_date)
2> VALUES (1,'Priyanka Rani', 2025-01-01);
3> GO
Msg 206, Level 16, State 2, Server studentsqlserver99, Line 1
Operand type clash: int is incompatible with date
1> SELECT *FROM students
2> ;
3> GO
id          name                                                                                                 enrolled_date   
----------- ---------------------------------------------------------------------------------------------------- ----------------

(0 rows affected)
1> INSERT INTO students (id, name, enrolled_date)
2> VALUES (1,'Priyanka Rani', '2025-01-01');
3> GO

(1 rows affected)
1> SELECT *FROM students
2> GO
id          name                                                                                                 enrolled_date   
----------- ---------------------------------------------------------------------------------------------------- ----------------
          1 Priyanka Rani                                                                                              2025-01-01

(1 rows affected)
1> 