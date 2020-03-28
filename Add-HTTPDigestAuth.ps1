<#
.SYNOPSIS
    This script will calculate the htdigest password in an MD5-hash.

.DESCRIPTION
    This script generates contents for the .htdigest file for your Web Server to perform HTTP Digest Authentication. This tool encrypts the password in an MD5-hash and will add the username and realm so that it is usable in a .htdigest file. As icing on the cake, this script updates your .htdigest file.

.EXAMPLE
    Add-DigestAuth -username [username] -realm [realm] -password [password]

.NOTES  
    Created by  : T13nn3s
    Version     : 1.00 (15 december 2017)
#>

function Add-HTTPDigestAuth {
    [CmdletBinding()]

    param (
        [parameter(
            Mandatory = $true,
            HelpMessage = "Enter the username used in the HTTP Digest authentication",
            Position = 1
        )][Alias("user")]
        [string]$username,  
        [parameter(
            Mandatory = $true,
            HelpMessage = "realm is specified by the AuthName with HTTP Digest Authentication. Realm with HTTP Digest is mandatory.",
            Position = 2
        )][Alias("r")]
        [string]$realm,
        [parameter(
            Mandatory = $true,
            HelpMessage = "Enter the password used in the HTTP Digest authentication",
            Position = 3
        )][Alias("pass")]
        [string]$password     
    ) #end param

    #set location of .htdigst file
    $file = ".\htpasswd"
    
    #combine username, realm and password -> output in string
    $hash = [Security.Cryptography.HashAlgorithm]::Create("MD5")
    $enc = [system.Text.Encoding]::UTF8
    $data = $enc.GetBytes("${username}:${realm}:$password")
    $value = -join ($hash.ComputeHash($data) | ForEach-Object { "{0:x2}" -f $_ })
    $string = "${username}:${realm}:${value}"

    #Add user to .htdigest file
    Add-Content -Path $file -Value $string

} #end function






