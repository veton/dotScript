function Get-BodyIndexers([Type] $type) {
    return $type.GetProperties($global:BindingFlags) | `
        Where-Object { $_.GetIndexParameters() } | `
        ForEach-Object {
            if (Test-BodyIndexerSupported $_) {
                $commentIfNotSupported = ""
            }
            else {
                $commentIfNotSupported = "////Not supported: "
            }

            $indexerType = 'any' # $(Get-MemberTypeName $_.PropertyType)
            return "    $commentIfNotSupported$(Get-MemberModifiers $_)[$(Get-MethodParameters $_.GetIndexParameters())]: $indexerType; "
        }
}
