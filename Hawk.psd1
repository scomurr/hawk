#
# Module manifest for module 'PSGet_Hawk'
#
# Generated by: hawk_feedback@microsoft.com
#
# Generated on: 10/13/2017
#

@{

# Script module or binary module file associated with this manifest.
RootModule = '.\Hawk.psm1'

# Version number of this module.
ModuleVersion = '1.6.1'

# Supported PSEditions
# CompatiblePSEditions = @()

# ID used to uniquely identify this module
GUID = '1f6b6b91-79c4-4edf-83a1-66d2dc8c3d85'

# Author of this module
Author = 'hawk_feedback@microsoft.com'

# Company or vendor of this module
CompanyName = 'Matt Byrd'

# Copyright statement for this module
Copyright = '(c) 2017 matbyrd@microsoft.com. All rights reserved.'

# Description of the functionality provided by this module
Description = 'The Hawk module has been designed to ease the burden on O365 administrators who are performing a forensic analysis in their organization.  It accelerates the gathering of data from multiple sources in the service.

It does NOT take the place of a human reviewing the data generated and is simply here to make data gathering easier.

Hawk has moved to GitHub and is availble for all to contribute.
https://github.com/Canthv0/hawk
'

# Minimum version of the Windows PowerShell engine required by this module
PowerShellVersion = '5.0'

# Name of the Windows PowerShell host required by this module
# PowerShellHostName = ''

# Minimum version of the Windows PowerShell host required by this module
# PowerShellHostVersion = ''

# Minimum version of Microsoft .NET Framework required by this module. This prerequisite is valid for the PowerShell Desktop edition only.
# DotNetFrameworkVersion = ''

# Minimum version of the common language runtime (CLR) required by this module. This prerequisite is valid for the PowerShell Desktop edition only.
# CLRVersion = ''

# Processor architecture (None, X86, Amd64) required by this module
# ProcessorArchitecture = ''

# Modules that must be imported into the global environment prior to importing this module
RequiredModules = @(@{ModuleName = 'PSAppInsights'; ModuleVersion = '0.9.6'; })

# Assemblies that must be loaded prior to importing this module
RequiredAssemblies = @('Microsoft.IdentityModel.Clients.ActiveDirectory.WindowsForms.dll','Microsoft.IdentityModel.Clients.ActiveDirectory.dll')

# Script files (.ps1) that are run in the caller's environment prior to importing this module.
# ScriptsToProcess = @()

# Type files (.ps1xml) to be loaded when importing this module
# TypesToProcess = @()

# Format files (.ps1xml) to be loaded when importing this module
# FormatsToProcess = @()

# Modules to import as nested modules of the module specified in RootModule/ModuleToProcess
NestedModules = @('Tenant\Get-HawkTenantAzureAuthenticationLogs.ps1','Tenant\Get-HawkTenantConfiguration.ps1','Tenant\Get-HawkTenantEDiscoveryConfiguration.ps1',
'Tenant\Get-HawkTenantInboxRules.ps1','Tenant\Get-HawkTenantOauthConsentGrants.ps1','Tenant\Get-HawkTenantRBACChanges.ps1','Tenant\Search-HawkTenantActivityByIP.ps1',
'Tenant\Search-HawkTenantEXOAuditLog.ps1','Tenant\Start-HawkTenantInvestigation.ps1','User\Get-HawkUserAuthHistory.ps1','User\Get-HawkUserConfiguration.ps1',
'User\Get-HawkUserEmailForwarding.ps1','User\Get-HawkUserInboxRule.ps1','User\Get-HawkUserMailboxAuditing.ps1','User\Start-HawkUserInvestigation.ps1','User\Get-HawkUserAdminAudit.ps1',
'Tenant\Get-HawkTenantAuthHistory.ps1','User\Get-HawkUserHiddenRule.ps1','.\message\Get-HawkMessageHeader.ps1'
)

# Functions to export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no functions to export.
FunctionsToExport = 'Get-HawkTenantAzureAuthenticationLogs','Get-HawkTenantConfiguration','Get-HawkTenantEDiscoveryConfiguration','Get-HawkTenantInboxRules',
'Get-HawkTenantOauthConsentGrants','Get-HawkTenantRBACChanges','Get-HawkUserAuthHistory','Get-HawkUserConfiguration','Get-HawkUserEmailForwarding','Get-HawkUserInboxRule',
'Get-HawkUserMailboxAuditing','Initialize-HawkGlobalObject','Search-HawkTenantActivityByIP','Search-HawkTenantEXOAuditLog','Show-HawkHelp','Start-HawkTenantInvestigation',
'Start-HawkUserInvestigation','Update-HawkModule','Get-HawkUserAdminAudit','Get-HawkTenantAuthHistory','Get-HawkUserHiddenRule','Get-HawkMessageHeader'

# Cmdlets to export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no cmdlets to export.
CmdletsToExport = @()

# Variables to export from this module
# VariablesToExport = @()

# Aliases to export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no aliases to export.
AliasesToExport = @()

# DSC resources to export from this module
# DscResourcesToExport = @()

# List of all modules packaged with this module
# ModuleList = @()

# List of all files packaged with this module
# FileList = @()

# Private data to pass to the module specified in RootModule/ModuleToProcess. This may also contain a PSData hashtable with additional module metadata used by PowerShell.
PrivateData = @{

    PSData = @{

        # Tags applied to this module. These help with module discovery in online galleries.
        Tags = @("O365","Security","Audit","Breach","Investigation","Exchange","EXO","Compliance","Logon")

        # A URL to the license for this module.
        # LicenseUri = ''

        # A URL to the main website for this project.
        ProjectUri = 'https://github.com/Canthv0/hawk'

        # A URL to an icon representing this module.
        IconUri = 'https://dexvla.ch.files.1drv.com/y4mGq6B9xSbwzTZ8s2gUov42TsJMlHVKP1SvXpt5tG9a2vfa7xdqFmhYnlNokiZMPD72HFySMAEC9VdMYpA3uV0ZOloHO93MZ81DAtpg5lbOd2h9v1cp1ey5t4syE9SGtbDdL-WggiVoOayWT1dJC4vaw_bRQbfH8GpBTAEZkzFdcCBkOnml4CTl4b0BMu7BRxaE2iaZEv_QbgKFx_eZwsiOg'

        # ReleaseNotes of this module
        ReleaseNotes ='1.6.1 - Added Azure AppInsight integration
        1.6.0 - Added Get-HawkMessageHeader cmdlet to pull and analyse the header from an MSG file
        1.6.0 - Added support for sending data to an XML file that can be transformed with an XSLT
        1.6.0 - Published XSLT template to Azure
        1.5.0 - Added Get-HawkUserHiddenRule - Uses EWS Impersonation to search for Hidden inbox rules in a user mailbox (BETA)
        1.4.0 - Fixed issue with list of SKUs that can do Advanced AD searches
        1.4.0 - Added Get-HawkTenantAuthHistory.  It will return 48 hours with of unified audit logs for all users.
        1.3.2 - Fixed issue with JSON conversion throwing errors on duplicate properties
        1.3.1 - Updated Get-HawkUserAuthHistory to generate fewer files that are more readable
        1.3.1 - Updated Get-HawkUserAuthHistory to gather more authentication data
        1.2.6 - Included EMS sku in list of SKUs that can do advanced AD searches as the azure P1 plan is part of that SKU
        1.2.5 - Fixed issue with search-adminaudit log where in one instance it was only searching 14 days
        1.2.5 - Updated output files for Get-HawkUserAuthHistory to be more clear about what they contain
        1.2.5 - Updated output for Get-HawkUserAuthHistory so that it will always return all files
        1.2.4 - Updated with GitHub Link
        1.2.4 - Added Get-HawkUserAdminAudit to return all exo shell changes recorded in the admin audit log for a given user
        1.2.3 - Fixed issue where geoip lookups were failing
        1.2.3 - GeoIp lookups are now using http://api.ipstack.com users will need to provide their own API key due to 10k per month limit on free accounts
        1.2.3 - Introduced storing Hawk Data between sessions by storing in %localappdata%\hawk\hawk.json
        1.2.2 - Fixed issue where Get-HawkTenantAzureAuthenticationLogs was only retrieving 1000 results
        '
        # External dependent modules of this module
        # ExternalModuleDependencies = ''

    } # End of PSData hashtable

} # End of PrivateData hashtable

# HelpInfo URI of this module
# HelpInfoURI = ''

# Default prefix for commands exported from this module. Override the default prefix using Import-Module -Prefix.
# DefaultCommandPrefix = ''

}

