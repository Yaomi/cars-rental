#Requires -Version 5.0

Param(
    [string] [Parameter(Mandatory=$true)] $ResourceGroupName,
	[string[]] $ResourceTypes = @("Microsoft.Web/sites", "Microsoft.Sql/servers/databases")
)

$ResourceTypes | % {
	$odataQuery = "`$filter=resourcegroup eq '$ResourceGroupName'"

	if ($_ -ne '*') {
		$odataQuery += " and resourcetype eq '$_'"
	}
	  
	$resources = Get-AzureRmResource -ODataQuery $odataQuery
	$resources | Where-Object { $_.ResourceGroupName -eq $ResourceGroupName } | % { 
		Write-Output ('Processing {0}/{1}' -f $_.ResourceType, $_.Name)
		$_ | Remove-AzureRmResource -Verbose -Force
	}
}


# Example of usage
# .\CleanResourceGroup.ps1 -ResourceGroupName "AppServiceAndSql" -ResourceTypes "Microsoft.Web/sites","Microsoft.Sql/servers/databases"
