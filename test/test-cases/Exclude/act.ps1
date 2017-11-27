Write-Host "Converting to TypeScript..." -Foreground "DarkGray"

$excludedTypes = @(
    "TestSolution.TestAssembly.ExcludedClass",
    "TestSolution.TestAssembly.ExcludedNamespace.*"
)

Invoke-Converter `
    $global:TargetAssembly `
    $global:TargetScript `
    -ExcludeTypes $excludedTypes
