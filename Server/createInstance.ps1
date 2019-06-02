#Requires -Version 5.0

Param(
	[string] [Parameter(Mandatory=$true)] $ContainerRegistryName,
	[string] [Parameter(Mandatory=$true)] $ResourceGroupName,
	[string] [Parameter(Mandatory=$true)] $ImageName,
	[string] [Parameter(Mandatory=$true)] $Tag
)

try {
	az acr login -n $ContainerRegistryName
} catch {}

az container create --resource-group $ResourceGroupName --name car-rental-api --image ('{0}.azurecr.io/{1}:{2}' -f $ContainerRegistryName,$ImageName,$Tag) --cpu 1 --memory 1 --registry-login-server ('{0}.azurecr.io' -f $ContainerRegistryName) --registry-username <YOUR_USERNAME --registry-password <YOUR_PWD> --dns-name-label $ImageName --ports 80

# exampl.
# .\createInstance.ps1 -ResourceGroupName AppServiceAndSql -ContainerRegistryName myregistryname -ImageName car-rental-api -Tag 0.0.3