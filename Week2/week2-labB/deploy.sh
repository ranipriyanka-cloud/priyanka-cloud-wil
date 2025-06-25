#!/bin/bash
RG="lab2b-rg"
PARAMS="azuredeploy.parameters.json"

az group create --name $RG --location australiaeast
az deployment group create \
  --resource-group $RG \
  --template-file azuredeploy.json \
  --parameters @$PARAMS