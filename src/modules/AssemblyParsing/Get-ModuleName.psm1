function Get-ModuleName([Type] $type) {
    return (Get-Assembly $type).GetName().Name
}
