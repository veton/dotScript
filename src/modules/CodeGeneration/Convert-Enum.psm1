function Convert-Enum([Type] $type) {
    $values = [Enum]::GetValues($type) | `
        ForEach-Object { "    $(Get-MemberName $_.ToString()) = $([int]$_)" }

    "export enum $(Get-TypeName $type) {
$($values -Join ",`n")
}"
}