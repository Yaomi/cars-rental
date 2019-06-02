#Requires -Version 5.0

Param(
	[string] [Parameter(Mandatory=$true)] $ContainerRegistryName,
    [string] [Parameter(Mandatory=$true)] $ImageName,
	[string] [Parameter(Mandatory=$true)] $Tag
)

try {
	az acr login -n $ContainerRegistryName
} catch {}

az acr build --image car-rental-api:$Tag --registry $ContainerRegistryName --file Api/Dockerfile . 