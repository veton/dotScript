function Add-ImportedType([Type] $type) {
    if ([System.Threading.Tasks.Task].IsAssignableFrom($type)) {
        $type = [System.Threading.Tasks.Task]
    }

    if ($type.IsGenericType) {
        $type = $type.GetGenericTypeDefinition()
    }

    # Do not include duplicates
    if ($global:Context.ImportedTypes -Contains $type) { return }

    # Only include Types from Known Assemblies
    if (-not (Test-KnownType $type)) { return }

    # Do not include type from current Assembly
    $assemblyName = (Get-Assembly $type).GetName().Name
    if ($assemblyName -eq $global:Context.AssemblyName) { return }

    $global:Context.ImportedTypes += $type
}
