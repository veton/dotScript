function Get-Assembly([Type] $type) {
    if (-not $type.Assembly) {
        $type = [System.Reflection.IntrospectionExtensions]::GetTypeInfo($type)
    }

    return $type.Assembly
}