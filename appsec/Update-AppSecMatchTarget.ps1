function Update-AppSecMatchTarget
{
    Param(
        [Parameter(Mandatory=$true)]  [string] $ConfigID,
        [Parameter(Mandatory=$true)]  [int]    $VersionNumber,
        [Parameter(Mandatory=$true)]  [int]    $TargetID,
        [Parameter(Mandatory=$true)]  [string] $Body,
        [Parameter(Mandatory=$false)] [string] $EdgeRCFile = '~\.edgerc',
        [Parameter(Mandatory=$false)] [string] $Section = 'default',
        [Parameter(Mandatory=$false)] [string] $AccountSwitchKey
    )

    $Path = "/appsec/v1/configs/$ConfigID/versions/$VersionNumber/match-targets/$TargetID`?accountSwitchKey=$AccountSwitchKey"

    try {
        $Result = Invoke-AkamaiRestMethod -Method PUT -Path $Path -EdgeRCFile $EdgeRCFile -Section $Section -Body $Body
        return $Result
    }
    catch {
        throw $_.Exception 
    }
}