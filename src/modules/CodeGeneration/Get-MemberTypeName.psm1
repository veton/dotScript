function Get-MemberTypeName([Type] $type) {
    $genericDictionaries = (@($type) + $type.GetInterfaces()) | `
        Where-Object { $_.IsGenericType } | `
        Where-Object { $_.GetGenericTypeDefinition() -eq [System.Collections.Generic.IDictionary``2] }
    $genericDictionary = @($genericDictionaries)[0]
    if ($genericDictionary) {
        $keyType = Get-TypeName $genericDictionary.GenericTypeArguments[0]
        if ($global:SupportedIndexTypes -NotContains $keyType) {
            return "any"
        }

        $valueType = Get-TypeName $genericDictionary.GenericTypeArguments[1]
        return "{ [i: $keyType]: $valueType }"
    }

    if ([System.Collections.IDictionary].IsAssignableFrom($type)) {
        return "any"
    }

    $name = Get-TypeName $type
    if (-not $name) { $name = "any" }
    return $name
}
