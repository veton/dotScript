function Get-BodyMethods([Type] $type) {
    return $type.GetMethods($global:BindingFlags) | `
        Where-Object { -not $_.IsSpecialName } | ` # Exclude compiler-generated methods
        ForEach-Object { "    $(Get-MemberName $_.Name)($(Get-MethodParameters $_.GetParameters())): $(Get-MemberTypeName $_.ReturnType);" }
}
