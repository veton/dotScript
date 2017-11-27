function Get-BodyProperties([Type] $type) {
    return $type.GetProperties($global:BindingFlags) | `
        Where-Object { -not $_.GetIndexParameters() } | `
        ForEach-Object { "    $(Get-MemberModifiers $_)$(Get-MemberName $_.Name): $(Get-MemberTypeName $_.PropertyType);" }
}