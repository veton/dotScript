$DepencenciesCountCache = @{};

function Get-DepencenciesCount([System.Type] $type, [int] $depth = 0) {
    if ($type -eq $null) { return 0 }
    if ($type -eq [void]) { return 0 }
    if (Test-SystemType $type) { return 0 }
    if ($DepencenciesCountCache[$type])  { return $DepencenciesCountCache[$type] }
    if ($depth -ge 10) { return 1000 }
    
    $depth += 1
    $result = 1
    $result += Get-DepencenciesCount $type.BaseType $depth
    (Get-OwnInterfaces $type) | `
        ForEach-Object { $result += Get-DepencenciesCount $_ $depth }
    $type.GetGenericArguments() | `
        ForEach-Object { $result += Get-DepencenciesCount $_ $depth }
    $type.GetFields($global:BindingFlags) | `
        ForEach-Object { $result += Get-DepencenciesCount $_.FieldType $depth }
    $type.GetProperties($global:BindingFlags) | ForEach-Object {
        $result += Get-DepencenciesCount $_.PropertyType $depth
        $_.GetIndexParameters() | `
            ForEach-Object { $result += Get-DepencenciesCount $_.ParameterType $depth }
    }
    $type.GetMethods($global:BindingFlags) | ForEach-Object {
        $result += Get-DepencenciesCount $_.ReturnType $depth
        $_.GetParameters() | `
            ForEach-Object { $result += Get-DepencenciesCount $_.ParameterType $depth }
    }

    $DepencenciesCountCache[$type] = $result
    return $result
}
