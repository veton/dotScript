function Get-ExportedTypes($assembly, $include, $exclude) {
    $filterExpression = {
        $typeName = $_.FullName
        $isIncluded = (-not $include) -or ($include | ForEach-Object { $typeName -Like $_ }) -Contains $true
        $isExcluded = ($exclude | ForEach-Object { $typeName -Like $_ }) -Contains $true
        return $isIncluded -and (-not $isExcluded)
    }
    
    $sortExpression = {
        try {
            Get-DepencenciesCount $_
        }
        catch {
            Write-ErrorDetails $_
            throw
        }
    }

    return $assembly.GetExportedTypes() | `
        Where-Object $filterExpression | `
        Sort-Object -Property @{ Expression = $sortExpression }
}
