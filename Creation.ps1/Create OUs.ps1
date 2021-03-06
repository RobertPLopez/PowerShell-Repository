#single ou
New-ADOrganizationalUnit -Name <#yxz#> -Path <#yxz#>

#bulk OU creation
#Need to create a csv file with the name and path

#The csv should be laid out like:
#Name           Path
#TestOU1        C:\it\ou.csv
#TestOU2        C:\it\ou.csv
#TestOU3        C:\it\ou.csv

# Import active directory module for running AD cmdlets
Import-Module activedirectory

#Store the data from the CSV in the $ADOU variable. 
$ADOU = Import-csv <#C:\it\ou.csv#> #Need to put the exact path of ou csv file

#Loop through each row containing user details in the CSV file
foreach ($ou in $ADou)
    {#Read data from each field in each row and assign the data to a variable as below
    $name = $ou.name
    $path = $ou.path
    #Account will be created in the OU provided by the $OU variable read from the CSV file
    New-ADOrganizationalUnit -Name $name -path $path
}