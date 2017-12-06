function Import-Assembly([string] $assemblyPath) {
    $assembly = [System.Reflection.Assembly]::LoadFrom($assemblyPath)

    # Preload referenced assemblies
    $assemblyDir = Split-Path $assemblyPath
    $assembly.GetReferencedAssemblies() | ForEach-Object {
        $referencedPath = "$assemblyDir\$($_.Name).dll"
        if (Test-Path $referencedPath) {
            [System.Reflection.Assembly]::LoadFrom($referencedPath) | Out-Null
        }
    }

    return $assembly
}
