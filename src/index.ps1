<#
.SYNOPSIS
Convert .NET assembly into a TypeScript model.
Author: Vitalii Ulantikov

.PARAMETER AssemblyPath
Path of assembly to generate model from.

.PARAMETER ScriptPath
Path of file to write TypeScript model to.

.PARAMETER KnownAssemblies
If referenced .NET type is located in a known assembly, it will be imported.
Otherwise it will be referenced as 'any' in TypeSctipt.

.PARAMETER IncludeTypes
Names of types to be included.
If not specidfied - all types will be included.

.PARAMETER ExcludeTypes
Names of types to be excluded.

#>

Param(
    [string]
    [Parameter(Mandatory = $true)]
    $AssemblyPath,

    [string]
    [Parameter(Mandatory = $true)]
    $ScriptPath,

    [string[]]
    $KnownAssemblies = @(),

    [string[]]
    $IncludeTypes = @(),

    [string[]]
    $ExcludeTypes = @()
)

$ErrorActionPreference = "Stop"
Get-ChildItem "$PSScriptRoot\modules\*.psm1" -Recurse | Import-Module -Global

Write-Host "Converting Assembly '$AssemblyPath' to Script '$ScriptPath'..." -Foreground "Blue"

try {
    $assembly = Import-Assembly $AssemblyPath
    $global:Context = @{
        "AssemblyName"    = $assembly.GetName().Name;
        "KnownAssemblies" = $KnownAssemblies;
        "ImportedTypes"   = @()
    }

    $types = Get-ExportedTypes $assembly $IncludeTypes $ExcludeTypes
    $convertedTypes = $types | ForEach-Object { Convert-Type $_ }
    $imports = Get-Imports $global:Context.ImportedTypes
    
    $script = $imports -Join "`n"
    if ($script) { $script += "`n`n"}
    $script += ($convertedTypes -Join "`n`n")
    Set-Content $ScriptPath $script
}
catch {
    Write-ErrorDetails $_
    Exit 1
}

Write-Host "Done`n" -Foreground "Blue"