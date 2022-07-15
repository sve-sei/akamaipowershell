function Reset-APIKeyQuota
{
    Param(
        [Parameter(Mandatory=$true)]  [string] $Keys,
        [Parameter(Mandatory=$false)] [string] $EdgeRCFile = '~\.edgerc',
        [Parameter(Mandatory=$false)] [string] $Section = 'default',
        [Parameter(Mandatory=$false)] [string] $AccountSwitchKey
    )

    $Path = "/apikey-manager-api/v1/keys/quota-reset?accountSwitchKey=$AccountSwitchKey"
    $BodyObj = @{
        keys = ($Keys -split ',')
    }
    $Body = ConvertTo-Json $BodyObj

    try {
        $Result = Invoke-AkamaiRestMethod -Method POST -Path $Path -Body $Body -EdgeRCFile $EdgeRCFile -Section $Section
        return $Result
    }
    catch {
        throw $_ 
    }
}