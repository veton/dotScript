function Get-MethodParameters([System.Reflection.ParameterInfo[]] $parameters) {
    $code = $parameters | `
        ForEach-Object { "$(Get-MemberName $_.Name): $(Get-MemberTypeName $_.ParameterType)" }
    return $code -Join ', '
}