$DepencenciesCountCache = @{};

function Get-DepencenciesCount([System.Type] $type, [int] $depth = 0) {
    if ($type -eq $null)  { return 0 }
    if ($type -eq [void])  { return 0 }
    if ($depth -ge 10)  { return 1000 }
    if ($DepencenciesCountCache[$type])  { return $DepencenciesCountCache[$type] }
    if (Test-SystemType $type)  { return 1 }

    $depth += 1
    $result = Get-DepencenciesCount($type.BaseType)
    $type.GetGenericArguments() | % { $result += Get-DepencenciesCount $_ $depth }
    $type.GetFields($global:BindingFlags) | % { $result += Get-DepencenciesCount $_.FieldType $depth }
    $type.GetProperties($global:BindingFlags) | % {
        $result += Get-DepencenciesCount $_.PropertyType $depth
        $_.GetIndexParameters() | % { $result += Get-DepencenciesCount $_.ParameterType $depth }
    }
    $type.GetMethods($global:BindingFlags) | % {
        $result += Get-DepencenciesCount $_.ReturnType $depth
        $_.GetParameters() | % { $result += Get-DepencenciesCount $_.ParameterType $depth }
    }

    $DepencenciesCountCache[$type] = $result
    return $result
}
