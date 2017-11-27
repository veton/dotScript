# Test is Type is defined in one of Known Assemblies
function Test-KnownType([Type] $type) {
    if ([System.Threading.Tasks.Task].IsAssignableFrom($type)) { return $true }

    $assemblyName = (Get-Assembly $type).GetName().Name
    return `
        ($assemblyName -eq $global:Context.AssemblyName) -or `
        ($global:Context.KnownAssemblies -Contains $assemblyName)
}
