#Requires -Version 5.0

Param(
    [string] [Parameter(Mandatory=$true)] $Tag
)

docker build -f Api/Dockerfile -t car-rental-api:$Tag .

# example of usage
# .\build.ps1 -Tag 0.0.2