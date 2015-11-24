# Created by Eric Skaggs
# November 2014

# Adapted from the original script at https://companydirectory.codeplex.com by Cary Landers, March 29 2010.
# The Get-DistinguishedName() function was taken from https://gallery.technet.microsoft.com/scriptcenter/f7b246a4-95a2-4408-b1a1-73b53003883c by Nuno Mota, July 2011.

# This script is designed to import a CSV file and make changes to Active Directory based on the file's schema.

$ErrorActionPreference = "SilentlyContinue"

# Path for the CSV import
$records = import-csv -Path C:\Sample.csv

#Gets the user's Distinguished Name
Function Get-DistinguishedName($recordName) 
{  
   $searcher = New-Object System.DirectoryServices.DirectorySearcher([ADSI]'') 
   $searcher.Filter = "(&(objectClass=User)(samAccountName=$recordName))" 
   $result = $searcher.FindOne() 
 
   Return $result.GetDirectoryEntry().DistinguishedName 
}

foreach($record in $records)
{
	#get the distinguished name based on the value in the AccountName column
	$dn = Get-DistinguishedName($record.AccountName) 

	#get the user object in AD based on the distinguished name
	$User = [ADSI]"LDAP://$dn" 

	write-host -foregroundcolor blue ============================================================
	write-host -foregroundcolor green Starting update for $dn

	# Set the street address
	if ($record.sampleAddress -ne '') 
	{
		$User.Put("streetAddress", $($record.sampleAddress))
	}

	# Set the city
	if ($record.sampleCity -ne '') 
	{
		$User.Put("l", $($record.sampleCity))
	}

	# Set the state
	if ($record.sampleState -ne '')
	{
		$User.Put("st", $($record.sampleState))
	}

	# Set the zip
	if ($record.sampleZip -ne '')
	{
		$User.Put("postalCode", $($record.sampleZip)) 
	}

	# Set the home phone number
	if ($record.sampleHomePhone -ne '')
	{
		$User.Put("homePhone", $($record.sampleHomePhone))
	}

	# Set the mobile number
	if ($record.sampleCellPhone -ne '')
	{
		$User.Put("mobile", $($record.sampleCellPhone))
	}

	$User.setInfo()

	write-host -foregroundcolor green DONE!
}