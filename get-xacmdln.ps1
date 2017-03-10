<#
.SYNOPSIS
Lists active published applications command line and working directory based on search word.
.DESCRIPTION
Lists active published applications command line and working directory based on search word.
.PARAMETER XMLBroker
XML Broker to query. Can be a comma separated list.
.PARAMETER SearchWord
Word to search published application command line for.
.EXAMPLE
PS C:\> get-xacmdln.ps1 -XMLBROKER BROKER -SearchWord 'Office'
Queries the BROKER and retrieves list of active published applications whose command lines contains 'Office'
.NOTES
NAME        :  get-xacmdln
VERSION     :  1.11
CHANGE LOG - Version - When - What - Who
1.00 - 03/10/2017 - Initial script - Alain Assaf
1.01 - 03/10/2017 - Changed user input to use wildcards - Alain Assaf
1.11 - 03/10/2017 - Added get-xmlbroker function - Alain Assaf
LAST UPDATED:  03/10/2017
AUTHOR      :  Alain Assaf
.LINK
http://www.linkedin.com/in/alainassaf/
http://wagthereal.com
.INPUTS
None
.OUTPUTS
None
#>
Param(
    [parameter(Position = 0, Mandatory=$True )] 	
    [ValidateNotNullOrEmpty()]
    $SearchWord,

    [parameter(Position = 1, Mandatory=$False )]
    [ValidateNotNullOrEmpty()]
    $XMLBroker="YOURDC.DOMAIN.LOCAL" # Change to hardcode a default value for your XML Brokers
)

### START FUNCTION: get-xmlbroker #############################################
Function Get-xmlbroker { 
<#
    .SYNOPSIS
    Gets responsive Citrix.
    .DESCRIPTION
    Gets responsive Citrix.
    .PARAMETER XMLBrokers
    Required parameter. Server to use as an XML Broker. Can be a list separated by commas.
    .INPUTS
    None
    .OUTPUTS
    None
    .EXAMPLE
    PS> Get-xmlbroker SERVERNAME
    Query SERVERNAME to see if it responsive. Assumes that SERVERNAME is a Citrix XML Broker
    .LINK
    http://cgit0401v.ncsecu.local/Bonobo.Git.Server/Repository/ctxModules/
    http://www.linkedin.com/in/alainassaf/
    http://wagthereal.com
    .NOTES
    NAME        :  Get-xmlbroker
    VERSION     :  1.00
    CHANGE LOG - Version - When - What - Who
    1.00 - 03/08/2017 - Initial script - Alain Assaf
    LAST UPDATED:  03/08/2017
    AUTHOR      :  Alain Assaf
#>
    [CmdletBinding()] 
    param ([parameter(Position = 0, Mandatory=$False)]
           [ValidateNotNullOrEmpty()]
           $XMLBrokers
    )
            
    $DC = $XMLBrokers.Split(",")
    foreach ($broker in $DC) {
        if ((Test-Port $broker) -and (Test-Port $broker -port 1494) -and (Test-Port $broker -port 2598))  {
            $XMLBroker = $broker
            break
        }
    }
    Return $XMLBroker
}
### END FUNCTION: get-xmlbroker ###############################################

$wgapps =@()

#Get working XML Broker
$broker = Get-xmlbroker $XMLBroker

#add wildcards
write-verbose "User input: $SearchWord"
$SearchWord = '*'+ $SearchWord + '*'
write-verbose "Changed to: $SearchWord"

#Get list of active apps
Get-XAApplication * -ComputerName $broker | where {($_.Enabled -eq $True) -and ($_.CommandLineExecutable -like $SearchWord)} | select browsername,CommandLineExecutable,WorkingDirectory | fl