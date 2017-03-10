# get-xacmdln
Lists active published applications command line and working directory based on search word.

# PS> get-help .\get-xacmdln.ps1 -full

NAME<br>
    get-xacmdln.ps1
    
SYNOPSIS<br>
    Lists active published applications command line and working directory based on search word.
    
SYNTAX<br>
    get-xacmdln.ps1 [-SearchWord] <Object> [[-XMLBroker] <Object>] [<CommonParameters>]
    
    
DESCRIPTION<br>
    Lists active published applications command line and working directory based on search word.

PARAMETERS<br>
    -SearchWord <Object>
        Word to search published application command line for.
		
        Required?                    true
        Position?                    1
        Default value                
        Accept pipeline input?       false
        Accept wildcard characters?  false
        
    -XMLBroker <Object>
        XML Broker to query. Can be a comma separated list.
        
        Required?                    false
        Position?                    2
        Default value                YOURDC.DOMAIN.LOCAL
        Accept pipeline input?       false
        Accept wildcard characters?  false
        
    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer, PipelineVariable, and OutVariable. For more information, see 
        about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216).
    
INPUTS<br>
    None
    
OUTPUTS<br>
    None
    
NOTES
	<pre>NAME:  get-xacmdln
	   VERSION: 1.11
        CHANGE LOG - Version - When - What - Who
        1.00 - 03/10/2017 - Initial script - Alain Assaf
        1.01 - 03/10/2017 - Changed user input to use wildcards - Alain Assaf
        1.11 - 03/10/2017 - Added get-xmlbroker function - Alain Assaf
        LAST UPDATED: 03/10/2017
	    AUTHOR: Alain Assaf</pre>
    
    -------------------------- EXAMPLE 1 --------------------------
    
    PS C:\>get-xacmdln.ps1 -XMLBROKER BROKER -SearchWord 'Office'
    
    Queries the BROKER and retrieves list of active published applications whose command lines contains 'Office'
    
# Legal and Licensing
The get-xacmdln.ps1 script is licensed under the [MIT license][].

[MIT license]: LICENSE

# Want to connect?
* LinkedIn - https://www.linkedin.com/in/alainassaf
* Twitter - http://twitter.com/alainassaf
* Wag the Real - my blog - https://wagthereal.com
* Edgesightunderthehood - my other - blog https://edgesightunderthehood.com

# Help
I welcome any feedback, ideas or contributors.
