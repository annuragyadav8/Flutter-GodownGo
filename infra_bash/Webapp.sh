#!/bin/bash

# Set script to exit on error
set -e

# Variables
let "randomIdentifier=$RANDOM*$RANDOM"
RESOURCE_GROUP="learn-8077029c-f4b1-4d5c-b611-31b3b7c0c5f2"
LOCATION="eastus"
APP_NAME="godowngo-web-$randomIdentifier"
PLAN_NAME="godowngo-asp-882001824"
# GITHUB_REPO="https://github.com/princeryadav/Flutter-GodownGo.git"
# BRANCH="google_map_free_apis"

echo "Logging into Azure..."
az login

echo "Creating App Service Plan..."
az appservice plan create --name $PLAN_NAME --resource-group $RESOURCE_GROUP --sku S1

echo "Creating Web App..."
az webapp create --name $APP_NAME --resource-group $RESOURCE_GROUP --plan $PLAN_NAME 

# echo "Configuring GitHub deployment..."
# az webapp deployment source config --name $APP_NAME --resource-group $RESOURCE_GROUP \
#     --repo-url $GITHUB_REPO --branch $BRANCH --manual-integration

# echo "Enabling logging for the Web App..."
# az webapp log config --name $APP_NAME --resource-group $RESOURCE_GROUP --application-logging true

# Display the deployed app URL
# APP_URL=$(az webapp show --name $APP_NAME --resource-group $RESOURCE_GROUP --query defaultHostName --output tsv)
# echo "Deployment successful! Access your web app at: https://$APP_URL"