function Get-GenericTypeName([Type] $type) {
    $name = $type.Name.Remove($type.Name.IndexOf('`'));
    $genericTypeArguments = ($type.GenericTypeArguments + $type.GenericTypeParameters) | `
        ForEach-Object { Get-MemberTypeName $_ }
    return "$name<$($genericTypeArguments -Join ', ')>" 
}
