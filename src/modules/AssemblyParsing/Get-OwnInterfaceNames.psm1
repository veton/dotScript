function Get-OwnInterfaceNames([Type] $type) {
    $inheritedInterfaces = $type.GetInterfaces() | `
        ForEach-Object { $_.GetInterfaces() }
    if ($type.BaseType) {
        $inheritedInterfaces = $inheritedInterfaces, $type.BaseType.GetInterfaces() 
    }

    return $type.GetInterfaces() | `
        Where-Object { $_.IsPublic } | `
        Where-Object { -not (Test-SystemType $_) } | `
        Where-Object { -not ($inheritedInterfaces -Contains $_) } | `
        ForEach-Object { Get-TypeName $_ } | `
        Where-Object{ $_ }
}
