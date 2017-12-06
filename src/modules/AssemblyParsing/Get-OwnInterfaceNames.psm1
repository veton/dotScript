function Get-OwnInterfaceNames([Type] $type) {
    return (Get-OwnInterfaces $type) | `
        ForEach-Object { Get-TypeName $_ } | `
        Where-Object{ $_ }
}
