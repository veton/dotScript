function Get-BodyFields([Type] $type) {
    return $type.GetFields($global:BindingFlags) | `
        ForEach-Object { "    $(Get-MemberModifiers $_)$(Get-MemberName $_.Name): $(Get-MemberTypeName $_.FieldType);" }
}