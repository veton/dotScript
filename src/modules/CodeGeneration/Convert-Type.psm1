function Convert-Type([Type] $type) {
    Write-Host "    Converting '$(Get-TypeName $type)'" -Foreground "DarkGray"
    if ($type.IsNested) {
        return "// Skipped $($type.Name): Nested types are not supported"
    }
    if ($type.IsEnum) {
        return Convert-Enum $type
    }
    if ($type.IsClass -or $type.IsValueType) {
        return Convert-Class $type
    }
    if ($type.IsInterface) {
        return Convert-Interface $type
    }
}