# Return logon information from the Azure Audit logs
Function Get-HawkTenantAzureAuthenticationLogs {


    # Make sure we have a connection to MSOL since we will need it
    Test-MSOLConnection

    # Need to setup the hawk global object explicitly here instead of relying on out-logfile to do it
    Initialize-HawkGlobalObject
    Send-AIEvent -Event "CmdRun"

    # Make sure we have the needed license to access this report
    if ([bool]$hawk.AdvancedAzureLicense) {
        Out-LogFile "Verified that we can pull Azure AD Sign In Logs"
    }
    else {
        Out-LogFile "[ERROR] - No Azure AD Premium P1 or P2 license found on tenant"
        Write-Error -Message "Azure AD Premium P1 or P2 license required to access Azure AD Sign In Events" -ErrorAction Stop
        break
    }

    # Get our oauth token
    $oauth = Get-UserGraphAPIToken -AppIDURL "https://graph.windows.net"

    # Get the Oauth token Expiration time short 5 mintues
    $OauthExpiration =  (get-date ($oauth.ExpiresOn.UtcDateTime)).AddMinutes(-5)

    # Tenant Domain
    $TenantDomain = ((get-msoldomain | Where-Object {$_.isinitial -eq $true}).name)

    # Pull the current date -30 days in the correct format (logs only go back 30 days)
    [string]$PastPeriod = "{0:s}" -f (get-date).AddDays(-30) + "Z"

    # Build the filter for pulling the data
    [string]$Filter = "`$filter=signinDateTime+ge+" + $PastPeriod
    $Url = "https://graph.windows.net/" + $TenantDomain + "/activities/signinEvents?api-version=beta&" + $filter

    Out-LogFile ("Collecting Azure AD Sign In reports for tenant " + $tenantdomain)
    Out-Logfile ("URL: " + $Url)

    # Build access header
    $Header = @{'Authorization' = "$($oauth.AccessTokenType) $($oauth.AccessToken)"}

    # Null out report and setup our counter
    $Report = $null
    $i = 0

    do {

        # Null out our raw report
        $RawReport = $null

        try {
            $RawReport = Invoke-WebRequest -UseBasicParsing -Headers $Header -Uri $url
        }
        catch {
            Out-LogFile "[ERROR] - Error retrieving report"
            break
        }

        # Convert the report and then output it
        $Report += (ConvertFrom-Json -InputObject (($RawReport).content)).value

        # Get our next report url if we didn't get all of the data
        $Url = ($RawReport.Content | ConvertFrom-Json).'@odata.nextLink'

        $i++

        # We need to check for an expiring oauth token (could take some time to retrieve all data)
        # Don't need to check every time ... once per 10 is good
        if ($i % 10) {
            # If the current date is > expiration then we need to get a new token
            if ((get-date) -gt $OauthExpiration) {

                $oauth = Get-UserGraphAPIToken -AppIDURL "https://graph.windows.net"
                $Header = @{'Authorization' = "$($oauth.AccessTokenType) $($oauth.AccessToken)"}
                $OauthExpiration = (get-date $oauth.ExpiresOn).AddMinutes(-5)
            }
        }
    } while ($null -ne $Url)

    Out-LogFile ("Retrieved " + $Report.count + " Azure AD Sign In Entries")
    Out-MultipleFileType -FilePrefix Azure_Ad_signin -csv -Object $Report

    <#

	.SYNOPSIS
	Retrieves Azure AD Sign in Logs

	.DESCRIPTION
    Uses Graph API to retrieve Azure AD Signin Logs
    ** Requires that the tenant have an Azure AD P1 or P2 license or trial license

	.OUTPUTS

	File: Azure_AD_Signin.csv
	Path: \
	Description: Azure AD Signin Report

    .EXAMPLE
	Get-HawkTenantAzureAuthenticationLogs

	Returns all Azure AD Signin reports in CSV format

	#>
}