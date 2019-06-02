#Requires -Version 5.0

Param(
	[string] [Parameter(Mandatory=$true)] $ContainerRegistryName,
    [string] [Parameter(Mandatory=$true)] $ImageName,
	[string] [Parameter(Mandatory=$true)] $Tag
)

try {
	az acr login -n $ContainerRegistryName
} catch {}

docker tag ${ImageName}:${Tag} ('{0}.azurecr.io/{1}:{2}' -f $ContainerRegistryName,$ImageName,$Tag)
docker push ('{0}.azurecr.io/{1}:{2}' -f $ContainerRegistryName,$ImageName,$Tag)

# example of usage
# .\publish.ps1 -ContainerRegistryName myregistryname -ImageName car-rental-api -Tag 0.0.2