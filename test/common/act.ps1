Write-Host "Converting to TypeScript..." -Foreground "DarkGray"
Invoke-Converter `
    $global:TargetAssembly  `
    $global:TargetScript
