# HTTP Digest Authentication
This Powershell function generates contents for the .htdigest file for your Web Server to perform HTTP Digest Authentication. This tool encrypts the password in an MD5-hash and will add the username and realm so that it is usable in a .htdigest file. As icing on the cake, this script updates your .htdigest file.

# How to use
First, you need to load this function into your Powershell console.
```powershell
Import-Module .\Add-HTTPDigestAuth.ps1
```

Call the function
```powershell
Add-HTTPDigestAuth [-username] <String> [-realm] <String> [-password] <String> [<CommonParameters>]
```

# Changelog

## [1.0] 15 december 2017
Initial release

# Information
HTTP Digest Authenticaton - RFC 2069 => https://tools.ietf.org/html/rfc2069
