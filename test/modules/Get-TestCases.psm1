function Get-TestCases() {
    return Get-Item "$global:TestCasesDir\*" | `
        Where-Object { $_.PSIsContainer } | `
        Where-Object { -not $_.Name.StartsWith(".") } | `
        ForEach-Object { $_.Name }
}