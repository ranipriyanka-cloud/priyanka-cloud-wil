
    1. Resource Group Creation (10 points)
        The correct command to create a resource group (5 points)
        
        ***************************************************************************************
        The proper naming convention followed (2 points)
        ***************************************************************************************
        Tag with Key: Environment and Value: Development added (3 points)
        ***************************************************************************************
    2. Database Creation (20 points)
        The correct command to create a database (10 points)
        cloud250310 [ ~ ]$ serverName="exampleserverpriyanka"  
        cloud250310 [ ~ ]$ adminLogin="adminUser"  
        cloud250310 [ ~ ]$ password="MySecureP@ssw0rd123"
        cloud250310 [ ~ ]$ az sql server create --name $serverName --resource-group exampleRGPriyanka --location AustraliaEast --admin-user $adminLogin --admin-password $password  
            az sql db create --resource-group exampleRGPriyanka --server $serverName --name exampleDB --service-objective Basic --tags Environment=Development  

        ***************************************************************************************
        Database created inside the correct resource group (5 points)
        ***************************************************************************************
        Tag with Key: Environment and Value: Development added (5 points)
        ***************************************************************************************
    3. App Service Plan Creation (20 points)
        The correct command to create an app service plan (10 points)
        ***************************************************************************************
        App service plan created inside the correct resource group (5 points)
        ***************************************************************************************
        Tag with Key: Environment and Value: Development added (5 points)
        ***************************************************************************************
    4. App Services Creation (40 points)
        The correct command to create an app service for the API layer (10 points)
        ***************************************************************************************
        The correct command to create an app service for the user interface layer (10 points)
        ***************************************************************************************
        Both app services were created inside the correct app service plan and resource group (10 points)
        ***************************************************************************************
        Tag with Key: Environment and Value: Development added to each app service (10 points)
        ***************************************************************************************
    5. JSON View Submission (10 points)
        Correct JSON view of the resource group (2.5 points)
        Correct JSON view of the database (2.5 points)
        Correct JSON view of the app service plan (2.5 points)
        Correct JSON view of each app service (2.5 points)
